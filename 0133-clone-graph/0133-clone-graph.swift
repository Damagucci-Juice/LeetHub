/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var neighbors: [Node?]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.neighbors = []
 *     }
 * }
 */

class Solution {
    func cloneGraph(_ node: Node?) -> Node? {
        guard let node = node else { return nil }
        var visited = [Node?](repeating: nil, count: 101)
        let copy = Node(node.val)
        dfs(node, copy, &visited)
        return copy
    }
    
    func dfs(_ node: Node, _ copy: Node, _ visited: inout [Node?]) {
        visited[copy.val] = copy
        
        for n in node.neighbors {
            guard let n = n else { return }
            if let copiedNode = visited[n.val] {
                copy.neighbors.append(copiedNode)
            } else {
                let newNode = Node(n.val)
                copy.neighbors.append(newNode)
                dfs(n, newNode, &visited)
            }
        }
    }
}