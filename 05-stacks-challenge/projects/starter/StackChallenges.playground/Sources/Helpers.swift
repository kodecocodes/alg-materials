// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

public func example(of description: String, action: () -> ()) {
  print("---Example of \(description)---")
  action()
  print()
}
