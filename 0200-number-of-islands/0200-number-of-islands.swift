class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        let rLength = grid.count
        let cLength = grid[0].count
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: cLength), count: rLength)
        
        var landNum = 0 
        for r in 0..<rLength {
            for c in 0..<cLength {
                if !visited[r][c] && !isWater(r,c) {
                    dfs(r,c)    
                    landNum += 1
                }
            }
        }
        
        func dfs(_ r: Int, _ c: Int) {
            guard isValid(r,c) else { return }
                
            if !visited[r][c] && !isWater(r,c) {
                visited[r][c] = true
                if canGo(r,c) {
                    dfs(r+1,c) 
                    dfs(r, c+1)
                    dfs(r-1,c) 
                    dfs(r, c-1)
                }
            }
        }
        
        func canGo(_ r: Int, _ c: Int) -> Bool {
            if isValid(r+1,c) {
                if !visited[r+1][c] && !isWater(r+1,c) {
                    return true
                }  
            } 
            if isValid(r,c+1) {
                if !visited[r][c+1] && !isWater(r,c+1) {
                    return true
                }
            } 
            if isValid(r-1,c) {
                if !visited[r-1][c] && !isWater(r-1,c) {
                    return true
                }  
            } 
            if isValid(r,c-1) {
                if !visited[r][c-1] && !isWater(r,c-1) {
                    return true
                }
            } 
            return false
        }
        
        func isValid(_ r: Int, _ c: Int) -> Bool {
            0..<rLength ~= r && 0..<cLength ~= c
        }
        
        
        func isWater(_ r: Int, _ c: Int) -> Bool {
            grid[r][c] == "0"
        }
        
        return landNum
    }
}