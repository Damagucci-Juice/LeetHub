func solution() -> [Int] {
    let n = Int(readLine()!)!
    var graph = [[Int]](repeating: [], count: n + 1)
    var parents = [Int](repeating: 0, count: n + 1)
    var visited = [Bool](repeating: false, count: n + 1)
    
    for _ in 0..<n-1 {
        let edge = readLine()!.split(separator: " ").compactMap { Int($0) }
        graph[edge[0]].append(edge[1])
        graph[edge[1]].append(edge[0])
    }

    func dfs(_ node: Int) {
        visited[node] = true
        for next in graph[node] {
            if !visited[next] {
                parents[next] = node
                dfs(next)
            }
        }
    }

    dfs(1)

    return Array(parents.dropFirst(2))
}

solution().forEach { print($0) }
