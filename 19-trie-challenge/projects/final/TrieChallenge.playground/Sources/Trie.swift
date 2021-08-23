// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

public class Trie<CollectionType: Collection & Hashable> where CollectionType.Element: Hashable {
  
  public typealias Node = TrieNode<CollectionType.Element>
  
  private let root = Node(key: nil, parent: nil)
    
  public private(set) var collections: Set<CollectionType> = []
    
  public var count: Int {
    collections.count
  }
  
  public var isEmpty: Bool {
    collections.isEmpty
  }
  public init() {}
  
  public func insert(_ collection: CollectionType) {
    var current = root
    for element in collection {
      if current.children[element] == nil {
        current.children[element] = Node(key: element, parent: current)
      }
      current = current.children[element]!
    }
    if current.isTerminating {
      return
    } else {
      current.isTerminating = true
      collections.insert(collection)
    }
  }
  
  public func contains(_ collection: CollectionType) -> Bool {
    var current = root
    for element in collection {
      guard let child = current.children[element] else {
        return false
      }
      current = child
    }
    return current.isTerminating
  }
  
  public func remove(_ collection: CollectionType) {
    var current = root
    for element in collection {
      guard let child = current.children[element] else {
        return
      }
      current = child
    }
    guard current.isTerminating else {
      return
    }
    current.isTerminating = false
    collections.remove(collection)
    while let parent = current.parent, current.children.isEmpty && !current.isTerminating {
      parent.children[current.key!] = nil
      current = parent
    }
  }
}

public extension Trie where CollectionType: RangeReplaceableCollection {
  
  func collections(startingWith prefix: CollectionType) -> [CollectionType] {
    var current = root
    for element in prefix {
      guard let child = current.children[element] else {
        return []
      }
      current = child
    }
    return collections(startingWith: prefix, after: current)
  }
  
  private func collections(startingWith prefix: CollectionType, after node: Node) -> [CollectionType] {
    
    // 1
    var results: [CollectionType] = []
    
    if node.isTerminating {
      results.append(prefix)
    }
    
    // 2
    for child in node.children.values {
      var prefix = prefix
      prefix.append(child.key!)
      results.append(contentsOf: collections(startingWith: prefix, after: child))
    }
    
    return results
  }
}
