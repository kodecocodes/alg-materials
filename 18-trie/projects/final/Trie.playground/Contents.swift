// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

example(of: "insert and contains") {
  let trie = Trie<String>()
  trie.insert("cute")
  if trie.contains("cute") {
    print("cute is in the trie")
  }
}

example(of: "remove") {
  let trie = Trie<String>()
  trie.insert("cut")
  trie.insert("cute")
  
  print("\n*** Before removing ***")
  assert(trie.contains("cut"))
  print("\"cut\" is in the trie")
  assert(trie.contains("cute"))
  print("\"cute\" is in the trie")
  
  print("\n*** After removing cut ***")
  trie.remove("cut")
  assert(!trie.contains("cut"))
  assert(trie.contains("cute"))
  print("\"cute\" is still in the trie")
}

example(of: "prefix matching") {
  let trie = Trie<String>()
  trie.insert("car")
  trie.insert("card")
  trie.insert("care")
  trie.insert("cared")
  trie.insert("cars")
  trie.insert("carbs")
  trie.insert("carapace")
  trie.insert("cargo")
  
  print("\nCollections starting with \"car\"")
  let prefixedWithCar = trie.collections(startingWith: "car")
  print(prefixedWithCar)
  
  print("\nCollections starting with \"care\"")
  let prefixedWithCare = trie.collections(startingWith: "care")
  print(prefixedWithCare)
}
