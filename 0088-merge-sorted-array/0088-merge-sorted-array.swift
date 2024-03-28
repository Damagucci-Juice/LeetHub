class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        if m == 0 { 
            nums1 = nums2 
            return
        }
        if n == 0 { return }

        let n1 = Array(nums1[0..<m])
        nums1 = n1 + nums2
        nums1.sort()
    }
}