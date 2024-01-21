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

// 루트부터 1~n번 까지 나온다고 해서 BFS를 사용하는 것도 방법이겠다 싶었는데, 쭉 타고 들어가는 상황에서는 그저 DFS가 부모를 찾기에 더 적합하다는 생각을 했다. 
// DFS는 루트부터 leaf까지 쭉 타고 들어가기에 부모를 체크해야하는 로직에서는 더할 나위 없이 좋았다.
// 또 이게 가능했던 이유는 전체 노드의 개수가 주어지기 때문에 미리 배열을 짜놓을 수가 있어서 가능했지만, 만약 전체 노드의 개수가 주어지지 않고 root만 주어진다면 어떻게 고민해야할까? 
