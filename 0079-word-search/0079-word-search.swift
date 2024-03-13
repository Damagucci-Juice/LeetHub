typealias Point = (r: Int, c: Int)

class Solution {

    var ans = false
    
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let rSize = board.count
        let cSize = board[0].count
        let word = Array(word)
        var visited = Array(repeating: Array(repeating: false, count: cSize), count: rSize)
        
        for r in 0..<rSize {
            for c in 0..<cSize {
                dfs(0, Point(r, c), word, board, &visited)
            }
        }

        return ans
    }
    
        // 방문 처리를 어떻게 할 것인가? 
    // 1. 가장 상위에서만 방문처리를 함... 오 노 ~ dfs를 하면 현재는 방문처리를 해야함. 
    func dfs(_ index: Int, _ current: Point,
             _ word: [Character], _ map: [[Character]], _ visited: inout [[Bool]]) {
        let rSize = map.count
        let cSize = map[0].count
        // 1. 유효성 검증
        guard (0..<rSize ~= current.r)  && (0..<cSize ~= current.c) 
            && !visited[current.r][current.c] else { return }

        // 2. 탈출 조건을 만든다. 
        if index == word.count - 1 { 
            if map[current.r][current.c] == word.last! {
                ans = true
            }
            return
        }

        // 3. 현재 인덱스가 맞으면 다음 인덱스를 추가한다. 
        if map[current.r][current.c] == word[index] {
            let nextIndex = index + 1
            visited[current.r][current.c] = true 
            dfs(nextIndex, Point(current.r, current.c + 1), word, map, &visited)
            dfs(nextIndex, Point(current.r, current.c - 1), word, map, &visited)
            dfs(nextIndex, Point(current.r + 1, current.c), word, map, &visited)
            dfs(nextIndex, Point(current.r - 1, current.c), word, map, &visited)
            visited[current.r][current.c] = false
        }
    }
}