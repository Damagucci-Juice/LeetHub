class Solution {
    func bagOfTokensScore(_ tokens: [Int], _ power: Int) -> Int {
        var tokens = tokens.sorted()
        var power = power 
        var score = 0
        var leftIndex = 0
        var rightIndex = tokens.count - 1

        while leftIndex <= rightIndex {
            if tokens[leftIndex] <= power {
                power -= tokens[leftIndex]
                score += 1 
                leftIndex += 1
            } else {
                if leftIndex == rightIndex { break }
                if score > 0 {
                    power += tokens[rightIndex]
                    score -= 1
                }
                rightIndex -= 1
            }
        }

        return score
    }
}