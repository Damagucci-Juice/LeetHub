class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var ans = Set<[Int]>()

        func combiSum(_ index: Int, _ currentArr: [Int], _ curSum: Int) {
            if curSum > target { return }
            if curSum == target {
                ans.insert(currentArr.sorted())
                return
            }

            for i in 0..<candidates.count {
                let curNum = candidates[i]
                combiSum(i+1, currentArr + [curNum], curSum + curNum)
            }
        }

        combiSum(0, [], 0)

        return Array(ans)
    }
}