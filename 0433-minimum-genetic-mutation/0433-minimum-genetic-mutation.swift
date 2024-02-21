class Solution {
    func minMutation(_ startGene: String, _ endGene: String, _ bank: [String]) -> Int {
        guard bank.count > 1 else { return bank.contains(endGene) ? 1 : -1 }
        let bank = [startGene] + bank
        var map = [[String]](repeating: [], count: bank.count)
        var visited = [Bool](repeating: false, count: bank.count)
        var prev = [String](repeating: "", count: bank.count)
        var route = [String]()

        setup()
        bfs()
        reconstruction(prev)
    
        return (route.first ?? "") == startGene ? route.count - 1 : -1

        func setup() {
            for (curIndex, value) in bank.enumerated() {
                for next in curIndex+1..<bank.count {
                    let curGene = bank[curIndex]
                    let nextGene = bank[next]
                    let difference = zip(curGene, nextGene).filter{ $0 != $1 }
                    
                    if difference.count == 1 { 
                        map[curIndex].append(nextGene)
                    }
                }
            }
        }

        func bfs() {    // TODO: - 이걸 재귀적으로 바꾸기 
            var queue: [String] = [startGene]
            visited[0] = true 
            
            while !queue.isEmpty {
                let gene = queue.removeFirst() 
                let geneIndex = bank.firstIndex(of: gene) ?? 0
                for nextGene in map[geneIndex] {
                    let n = bank.firstIndex(of: nextGene) ?? 0
                    if !visited[n] {
                        queue.append(nextGene)
                        visited[n] = true
                        prev[n] = gene
                    }
                }
            }
        }

        func reconstruction(_ prev: [String]) {
            var at = endGene

            while true {
                if at == "" { break }
                route.append(at)
                if let index = bank.firstIndex(of: at) {
                    let before = prev[index]
                    at = before
                } else {
                    at = ""
                }
            }
            
            route.reverse()
        }
    }
}