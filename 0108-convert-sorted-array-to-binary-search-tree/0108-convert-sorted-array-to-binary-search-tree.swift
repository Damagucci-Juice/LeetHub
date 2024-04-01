/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        func midNode(_ root: TreeNode?, _ begin: Int, _ end: Int) {
            guard begin <= end else { return }
            let mid = Int((begin + end) / 2)
            root?.val = nums[mid]
            if begin <= mid-1 {
                let left = TreeNode()
                root?.left = left   
                midNode(root?.left,  begin, mid-1)
            }
            if mid+1 <= end {
                let right = TreeNode()
                root?.right = right
                midNode(root?.right, mid+1, end  )
            }
        }    
        
        let root = TreeNode()
        midNode(root, 0, nums.count-1)
        return root
    }
}