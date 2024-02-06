class Solution {
    func solve(_ board: inout [[Character]]) {
        let rows = board.count
        guard rows > 0 else { return }
        let cols = board[0].count

        
        // 모서리에서 시작하는 O를 일시적인 문자로 변경
        func dfs(_ r: Int, _ c: Int) {
            if r < 0 || r >= rows || c < 0 || c >= cols || board[r][c] != "O" {
                return
            }
            board[r][c] = "A"
            dfs(r+1,c)
            dfs(r-1,c)
            dfs(r,c+1)
            dfs(r,c-1)
        }

        // 모서리 마다 체크 
        for r in 0..<rows {
            dfs(r,0)
            dfs(r,cols-1)
        }

        for c in 0..<cols {
            dfs(0, c)
            dfs(rows-1, c)
        }

        // O -> X, A -> O
        for r in 0..<rows {
            for c in 0..<cols {
                if board[r][c] == "O" {
                    board[r][c] = "X"
                } else if board[r][c] == "A" {
                    board[r][c] = "O"
                }
            }
        }
    }
}