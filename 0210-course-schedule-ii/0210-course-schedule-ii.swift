class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        guard numCourses > 1 else { return [0] }

        var ans = [Int]()
        var visited = [Bool](repeating: false, count: numCourses)
        var recStack = [Bool](repeating: false, count: numCourses)
        var isCycle = false 
        var dict = [Int: [Int]]()
        
        for c in 0..<numCourses {
            dict[c] = [] 
        }
        
        for pre in prerequisites {
            let temp = dict[pre[0], default: []]
            dict[pre[0]] = temp + [pre[1]]
        }

        for k in dict.keys {
            visit(k)
        }

        func visit(_ course: Int) {
            guard !recStack[course] else {
                isCycle = true 
                return
            }
            guard !visited[course] else { return }
            visited[course] = true
            let adj = dict[course, default: []]
            
            recStack[course] = true 
            for n in adj {
                visit(n)
            }
            ans.append(course)
            recStack[course] = false
        }

        return isCycle ? [] : ans
    }
}