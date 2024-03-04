class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        guard n != 1 else { return [[1]] }
        guard k != 1 else { 
            var ans = [[Int]]()
            for i in 1...n {
                ans.append([i])
            }
            return ans 
        }
        
        var ans = [[Int]]()

        func combination(_ index: Int, _ current: [Int]) {
            if current.count == k { 
                ans.append(current)
                return 
            }

            for i in index..<n+1 {
                combination(i+1, current + [i])
            }
        }
        
        combination(1, [])

        return ans 
    }
}