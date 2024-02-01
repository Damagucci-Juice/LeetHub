class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var edge = [Int: [Int]]()
        var visited = [Bool](repeating: false, count: numCourses)
        var recStack = [Bool](repeating: false, count: numCourses)

        for pre in prerequisites {
            let from = pre[1]
            let to = pre[0]
            let tmp = edge[from, default: []]
            edge[from] = tmp + [to]
        }

        func isCycle(_ vertex: Int) -> Bool {
            if recStack[vertex] { return true }
            if visited[vertex] { return false }

            visited[vertex] = true
            recStack[vertex] = true 

            for adj in edge[vertex, default: []] {
                if isCycle(adj) {
                    return true 
                }
            }
            recStack[vertex] = false 
            return false
        }

        for vertex in edge.keys {
            if isCycle(vertex) { 
                return false
            }
        }

        return true
    }
}