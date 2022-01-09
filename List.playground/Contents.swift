import UIKit
import Foundation
enum ListError: Error {
    case syntaxError
    case otherError
}

public class Node<T> {
    var value: T
    var next: Node<T>?
    init(value: T) {
        self.value = value
    }
}

class SingleLinkedList<T>  {
    var head: Node<T>?
    public var isEmpty: Bool {
        return head == nil
    }
    public var first: Node<T>? {
        return head
    }
    
    // append: (T) -> void
    public func append(value: T) {
        let newNode = Node(value: value)
        if var temp = head {
            while temp.next != nil {
                temp = temp.next!
                
            }
            temp.next = newNode
        } else {
            head = newNode
            
        }
    }
    
    // emty: () -> Boolean
    func empty() throws -> Bool {
        return head == nil
        
    }
    // count: () -> Int
    func count() -> Int {
        guard var node = head else {
            return 0
        }
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
        
    }
    
    // first: () -> T
    func firstElement() -> Node<T>? {
        return first
    }
    // index: (Int) -> T
    func index(position: Int) -> Node<T> {
        if position == 0 {
            return head!
        } else {
            var node = head?.next
            for _ in 1 ..< position {
                node = node?.next
                if node == nil {
                    break
                }
            }
            return node!
        }
    }
    
    // prepend: (T) -> void
    func insert(data : T, at position : Int) {
        let newNode = Node(value: data)
        if (position == 0) {
            newNode.next = head
            head = newNode
        }
        else {
            var previous = head
            var current = head
            for _ in 0..<position {
                previous = current
                current = current?.next
            }
            newNode.next = previous?.next
            previous?.next = newNode
        }
    }
    
    // remove: (Int) -> void
    func remove(at position: Int) {
        if head == nil{
            return
        }
        var temp = head
        if (position == 0)
        {
            head = temp?.next
            return
        }
        for _ in 0..<position-1 where temp != nil {
            temp = temp?.next
        }
        if temp == nil || temp?.next == nil{
            return
        }
        let nextToNextNode = temp?.next?.next
        temp?.next = nextToNextNode
    }
    
    // filter: (T -> Boolean) -> void
    public func filter(predicate: (T) -> Bool) -> Void {
        let result = SingleLinkedList()
        var node = head
        while node != nil {
            if predicate(node!.value) {
                result.append(value: )
            }
            node = node!.next
        }
    }
    
    func printList() {
        var current: Node? = head
        //assign the next instance
        while (current != nil) {
            print("Item: \(current?.value as? String ?? "")")
            current = current?.next
        }
    }
}

var list1 = SingleLinkedList<String>()

list1.append(value: "Test11")

list1.append(value: "Test2")

list1.append(value: "Test3")
list1.printList()

do {
   try list1.empty()
} catch {
    print(ListError.otherError)
}
list1.firstElement()
list1.count()
list1.index(position: 1)

list1.filter { test in
    test.hasPrefix("s")
}
