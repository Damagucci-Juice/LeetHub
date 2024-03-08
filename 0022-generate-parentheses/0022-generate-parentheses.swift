class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        let targetNum = n * 2
        var ans = [String]()

        func combi(_ index: Int, _ stack: String) {
            if stack.count == targetNum {
                if isParentheses(stack) { ans.append(stack) }
                return
            }

            for i in index..<targetNum {
                combi(i+1, stack + "(")
                combi(i+1, stack + ")")
            }
        }

        combi(1, "(")
        return ans 
    }

    func isParentheses(_ candidate: String) -> Bool {
        guard candidate.first! == "(" else { return false }
        var count = 1
        for (index, char) in candidate.enumerated() {
            if index == 0 { continue }
            if count < 0 { return false }
            if char == "(" { count += 1 }
            else { count -= 1 }
        }
        
        return count == 0
    }
}