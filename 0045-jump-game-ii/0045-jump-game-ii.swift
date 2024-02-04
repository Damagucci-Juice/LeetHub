class Solution {
    func jump(_ nums: [Int]) -> Int {
        guard 1 <= nums.count && nums.count <= Int.max else { return 0 }
        var step = 0, end = 0, maxPos = 0
        for i in 0..<nums.count-1 {
            maxPos = max(maxPos, i + nums[i])
            if i == end {
                step += 1
                end = maxPos
            }
        }
        return step 
    }
}