class Node {
    var key: String 
    var data: String?
    var children = [String: Node]()

    init(_ key: String = "", data: String? = nil) {
        self.key = key
        self.data = data
    }
}

class Trie {

    var head: Node

    init() {
        self.head = Node()
    }
    
    // for-loop을 돌면서 자식이 없으면 자식을 만들어서 추가하고 현재를 자식으로 가져옴 
    // 맨 마지막 node에 도달하면 데이터를 주입 
    func insert(_ word: String) {
        var cur = head

        for char in word {
            let char = String(char)
            if !cur.children.keys.contains(char) {
                cur.children[char] = Node(char)
            } 
            cur = cur.children[char, default: Node()]
        }
        cur.data = word
    }
    
    // 문자를 for-loop을 돌면서 자식이 있으면 참, 없으면 거짓
    func search(_ word: String) -> Bool {
        var cur = head

        for char in word {
            let char = String(char)
            if cur.children.keys.contains(char) {
                cur = cur.children[char, default: Node()]
            } else { return false }
        }

        return cur.data != nil
    }
    
    // 접두사 끝까지 도달해서 자식이 있거나, 데이터가 있으면 참, 아니면 거짓
    func startsWith(_ prefix: String) -> Bool {
        var cur = head

        for char in prefix {
            let char = String(char)
            if cur.children.keys.contains(char) {
                cur = cur.children[char, default: Node()]
            } else { return false }
        }

        return (cur.data != nil) || !cur.children.keys.isEmpty
    }
}

/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */