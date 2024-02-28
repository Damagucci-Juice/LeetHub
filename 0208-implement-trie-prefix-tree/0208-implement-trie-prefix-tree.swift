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