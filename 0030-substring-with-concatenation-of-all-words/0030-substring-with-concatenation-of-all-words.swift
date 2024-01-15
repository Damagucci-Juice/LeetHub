class Solution {
    
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        guard !words.isEmpty else { return [] }

        let wordLength = words.first!.count
        let windowLength = wordLength * words.count
        var answer: [Int] = []
        var wordCount = [String: Int]()

        for word in words {
            wordCount[word, default: 0] += 1
        }

        let sArray = Array(s)
        let sLength = sArray.count

        if sLength < windowLength { return [] }

        for i in 0..<wordLength {
            var left = i
            var right = i
            var currentCount = [String: Int]()

            while right + wordLength <= sLength {
                let word = String(sArray[right..<right + wordLength])
                right += wordLength

                if let _ = wordCount[word] {
                    currentCount[word, default: 0] += 1

                    while currentCount[word]! > wordCount[word]! {
                        let leftWord = String(sArray[left..<left + wordLength])
                        currentCount[leftWord, default: 0] -= 1
                        left += wordLength
                    }

                    if right - left == windowLength {
                        answer.append(left)
                    }
                } else {
                    currentCount.removeAll()
                    left = right
                }
            }
        }

        return answer
    }
}