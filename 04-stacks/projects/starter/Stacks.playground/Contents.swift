// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

import Foundation

public struct Stack<Element> {
    private var storage: [Element] = []
    
    public init() { }
    
    public init(_ elements: [Element]) {
        storage = elements
    }
    
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        storage.popLast()
    }
    
    public func peek() -> Element? {
        storage.last
    }
    
    public var isEmpty: Bool {
        peek() == nil
    }
}

func reverseArray<Element>(_ array: [Element]) -> [Element] {
    var newArr: [Element] = []
    var stack = Stack(array)
    for _ in array {
        newArr.append(stack.pop()!)
    }
    return newArr
}

func isBalanced(string: String) -> Bool {
    var opening = 0
    var closing = 0
    var stack = Stack<Character>()
    for char in string {
        stack.push(char)
    }
    
    while let char = stack.pop() {
        if char == "(" {
            opening += 1
        }
        if char == ")" {
            closing += 1
        }
    }
    
    return opening == closing
    
}

extension Stack: CustomStringConvertible {
    // Create an array that maps the elements to String via storage.map
    // Create a new array that reverses the previous array
    // Flattening the array into a string
    public var description: String {
        """
        ----top----
        \(storage.map { "\($0)" }.reversed().joined(separator: "\n"))
        -----------
        """
    }
}

// Make Stack initializable from an array literal
extension Stack: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: Element...) {
        storage = elements
    }
}

example(of: "using a stack") {
    var stack = Stack<Int>()
    stack.push(1)
    stack.push(2)
    stack.push(3)
    stack.push(4)
    
    print(stack)
    
    if let poppedElement = stack.pop() {
        assert(4 == poppedElement)
        print("Popped: \(poppedElement)")
    }
}

example(of: "initializing a stack from an array") {
    let array = ["A", "B", "C", "D"]
    var stack = Stack(array)
    stack.pop()
    print(stack)
}

example(of: "initializing a stack from array literal") {
    let stack: Stack = [1.0, 2.0, 3.0, 4.0]
    print(stack)
}

example(of: "reversing an array using stack") {
    let arr = [1, 2, 3, 4]
    let result = reverseArray(arr)
    
    print(result)
}

example(of: "balance the parentheses") {
    let string1 = "h((e))llo(world)()"
    let string2 = "(hello world"
    
    print(isBalanced(string: string1))
    print(isBalanced(string: string2))
}
