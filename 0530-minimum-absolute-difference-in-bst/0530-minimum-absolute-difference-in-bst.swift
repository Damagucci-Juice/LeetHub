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
    func getMinimumDifference(_ root: TreeNode?) -> Int {
        var traverse = [Int]()
        
        inorder(root)
        
        func inorder(_ node: TreeNode?) {
            guard let node = node else { return }
            
            inorder(node.left)
            traverse.append(node.val)
            inorder(node.right)
        }
        
        var minimum = Int.max - 1
        
        for ti in 1..<traverse.count {
            let difference = abs(traverse[ti] - traverse[ti-1])
            minimum = min(minimum, difference)
        }
        
        return minimum
    }
}