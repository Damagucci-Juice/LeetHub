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
    func findBottomLeftValue(_ root: TreeNode?) -> Int {
        // 높이를 구한다. 
        // 구한 높이를 바탕으로 가장 마지막 단의 리프를 조사한다. 그리고 그것의 첫번 째 결과값을 반환한다. 끝 ~ 
        var result = [Int]()
        
        func bfs(_ root: TreeNode?, curHeight: Int) {
            guard let node = root else { return }
        
            if curHeight > 1 {
                bfs(node.left, curHeight: curHeight - 1)
                bfs(node.right, curHeight: curHeight - 1)
            } else if curHeight == 1 {
                result.append(node.val)
            }
        }
        bfs(root, curHeight: height(root))
        
        return result.first ?? 0
    }
    
    func height(_ node: TreeNode?) -> Int {
        guard let node = node else { return 0 }
        var lh = height(node.left)
        var rh = height(node.right)
        
        if lh > rh {
            lh += 1 
        } else { 
            rh += 1
        }
        
        return max(lh, rh)
    }
}