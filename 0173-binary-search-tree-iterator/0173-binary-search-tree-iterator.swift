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

class BSTIterator {

    private var keys = [Int]()
    
    init(_ root: TreeNode?) {
        func inorderTraversal(_ root: TreeNode?) {
            if let root = root { 
                inorderTraversal(root.left)
                keys.append(root.val)
                inorderTraversal(root.right)
            }
        }
        inorderTraversal(root)
    }
    
    func next() -> Int {
        keys.removeFirst()
    }
    
    func hasNext() -> Bool {
        !keys.isEmpty
    }
}

/**
 * Your BSTIterator object will be instantiated and called as such:
 * let obj = BSTIterator(root)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */