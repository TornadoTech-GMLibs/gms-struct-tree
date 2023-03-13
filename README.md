Tree structures is a package for your project, with a handy implementation of trees for GameMaker Studio 2 using constructors.
The package was originally written for the personal work of TornadoTech projects, but was uploaded to GitHub for the convenience of all developers.

Also, the root can have a value, but you can simply not declare a value, then it will default to `undefined`.
To create a tree just write:

```js
var tree = new Tree();
show_debug_message(tree.value); // undefined 

var tree2 = new Tree("Same data");
show_debug_message(tree2.value); // "Same data" 
```

You can add nodes to the root of the tree as well as to other nodes. To add a node, write,<br>
`add(key, value)` and to turn it into a string you need to call the `to_string()` method

```js
tree = new Tree();

// Layer 1
var node_a = tree.add("node_a", 10);
var node_b = tree.add("node_b", 7);

// Layer 2
var node_a2 = node_a.add("node_a2", 3);
var node_a3 = node_a.add("node_a3", 3);
var node_a4 = node_a.add("node_a4", 3);

// Layer 3
var node_c = node_a2.add("node_c", 20);
var node_d = node_a4.add("node_d", 37);

show_debug_message(tree.to_string());

// Result:
// [root]: undefined
// _ [node_a]: 10
// _ _ [node_a2]: 3
// _ _ _ [node_c]: 20
// _ _ [node_a3]: 3
// _ _ [node_a4]: 3
// _ _ _ [node_d]: 37
// _ [node_b]: 7
```

You can use `exists(key)` to check if a node exists, and `remove(key)` to remove it.

```js
tree = new Tree();
// Layer 1
var node_a = tree.add("node_a", 23);
var node_b = tree.add("node_b", 29);

// Layer 2
var node_c = node_a.add("node_c", 48);

tree.exists("node_a"); // true
tree.exists("node_c"); // true
tree.exists("node_j"); // false

tree.remove("node_a");

tree.exists("node_a"); // false
tree.exists("node_c"); // false
```

And the main thing is of course you can get the `find(key)` node, which will return the tree structure.
And to read and write information, you can refer to the `key` and `value` fields. And to get the parent, refer to `parent`.

```js
tree = new Tree();

// Layer 1
var node_a = tree.add("node_a", 10);
var node_b = tree.add("node_b", 7);

// Layer 2
var node_a2 = node_a.add("node_a2", 3);
var node_a3 = node_a.add("node_a3", 3);
var node_a4 = node_a.add("node_a4", 3);

// Layer 3
var node_c = node_a2.add("node_c", 20);
var node_d = node_a4.add("node_d", 37);

var node = tree.find("node_d");
show_debug_message(node.value); // 37
show_debug_message(node.key); // "node_d"

// node.parent - reference to "node_a4"
show_debug_message(node.parent.value); // 3
show_debug_message(node.parent.key); // "node_a4"
```