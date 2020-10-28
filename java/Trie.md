# Trie (Prifix Tree)
![Trie](https://upload.wikimedia.org/wikipedia/commons/b/be/Trie_example.svg)

The path from the root to each node is a preifx of a word in the dictionary. Java Implementation is 

## Comparison

## Structure
```java
// Solution 1: for a sparse trie
// node 1 {(a -> node ref), (b -> node ref), (c -> node ref)}
class TrieNode {
  // Map a charactor to its corresponding child
  Map<Charactor, TrieNode> children;
  boolean isWord;
  int value; // for number node only
}

// Solution 2: for a dense trie
// assumption: only lower case words stored
// 0 --> 'a'
// 1 --> 'b' etc
class TrieNode {
  TrieNode[] children; // length = 26
  boolean isWord;
  int value;
}
```
Which one is better? Depends.

## Trie's drawbacks
Similar to Linked List, if stored on disk, expensive random access. 
* Time: random access is expensive
* Space: Overhead + locality, especially if the tree is sparse

## Search "cath" in a trie.
* not found --> return false
* found part of the word, finally stop at a word node --> return false
* found the whole word and stop at a number node --> return true

## Insert "carp" into a trie
* part of the word not found --> add new node
* find all word but no number --> add one more number node
* find all --> do nothing

## Delete "cat"
* find all word, locate the number node, `isWord = false`
* maintain a `count`

## Common questions
* Find all with prefix "ca" --> DFS
* word match "??p", "ca?" --> DFS, even for "\*" cases
* Boggle Game --> DFS -optimized-> Trie



