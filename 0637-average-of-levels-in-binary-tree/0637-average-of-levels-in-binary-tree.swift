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
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        guard let root = root else { return [] }
        let h = height(root)

        var sums = Array(repeating: [Int](), count: h)
        
        func levelOrder(_ node: TreeNode?, _ cur: Int, _ level: Int) {
            guard let node = node else { return }
            let index = level - 1 
            if cur == 1 {
                sums[index].append(node.val)
                return 
            } else if cur > 1 {
                levelOrder(node.left, cur-1, level)
                levelOrder(node.right, cur-1, level)
            }
        }
        
        for i in 1...h {
            levelOrder(root, i, i)
        }
        
        return sums.map { arr in
            let average = Double(arr.reduce(0) { $0 + $1 }) / Double(arr.count)
            return average
        }
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