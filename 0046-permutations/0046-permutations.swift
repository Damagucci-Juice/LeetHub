class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var ans = [[Int]]()

        func per(_ index: Int, _ current: [Int]) {
            if current.count == nums.count {
                ans.append(current)
                return
            }

            for i in 0..<nums.count {
                if current.contains(nums[i]) { continue }
                let moduledIndex = (index % nums.count) + 1
                per(moduledIndex, current + [nums[i]])
            }
        }

        per(0, [])
        return ans
    }
}