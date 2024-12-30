// Copyright (c) 2025 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

example(of: "using a stack") {
  var stack = Stack<Int>()
  stack.push(1)
  stack.push(2)
  stack.push(3)
  stack.push(4)

  print(stack)

  if let poppedValue = stack.pop() {
    assert(4 == poppedValue)
    print("Popped: \(poppedValue)")
  }
}

example(of: "initializing a stack from an array literal") {
  var stack: Stack = [1.0, 2.0, 3.0, 4.0]
  print(stack)
  stack.pop()
}

example(of: "initializing a stack from an array") {
  let array = ["A", "B", "C", "D"]
  var stack = Stack(array)
  print(stack)
  stack.pop()
}

example(of: "sendability") { @MainActor in // 1.
  // 2.
  let task = Task.detached {
    return Stack([1])
  }
  // 3.
  Task.detached {
    let value = await task.value
    print(value)
  }
}
