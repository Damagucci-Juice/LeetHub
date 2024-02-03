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
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        
        let height = height(root)
        var levelTraversal = [[Int]](repeating: [Int](), count: height)
     
        func dfs(_ node: TreeNode?, _ cur: Int, _ level: Int) {
            guard let node = node else { return }
            let reachedTargetLevel = cur == 1

            if reachedTargetLevel {
                levelTraversal[level-1].append(node.val)
            } else if cur > 1 {
                let rightToLeft = level.isMultiple(of: 2)

                if rightToLeft {
                    dfs(node.right, cur-1, level)
                    dfs(node.left, cur-1, level)
                } else {
                    dfs(node.left, cur-1, level)
                    dfs(node.right, cur-1, level)
                }
            }
        }
        
        for i in 1...height {
            dfs(root, i, i)
        }
        
        return levelTraversal
        
    }
    
    
    func height(_ node: TreeNode?) -> Int {
        guard let node = node else { return 0 }
        
        var lH = height(node.left)
        var rH = height(node.right)
        
        if lH > rH {
            lH += 1
        } else { 
            rH += 1
        }
        return max(lH, rH)
    }
}