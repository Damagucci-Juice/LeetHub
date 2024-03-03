class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        guard !digits.isEmpty else { return [] }
        let numMap = [
            [],
            [],
            ["a","b","c"],
            ["d","e","f"],
            ["g","h","i"],
            ["j","k","l"],
            ["m","n","o"],
            ["p","q","r","s"],
            ["t","u","v"],
            ["w","x","y","z"],
        ]

        var ans = [String]()
        let digits = Array(digits)

        combi(0, "")

        func combi(_ curIndex: Int, _ current: String) {
            if current.count == digits.count {
                ans.append(current)
                return
            }
            let curNum = Int(String(digits[curIndex])) ?? 0
            for char in numMap[curNum] {
                combi(curIndex+1, current + char)
            }
        }

        return ans
    }
}