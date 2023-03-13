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

show_debug_message("\n");
show_debug_message("new Tree().to_string(); method");
show_debug_message(tree.to_string());

show_debug_message("new Tree().exists(key); method");
show_debug_message("Node \"node_c\" exists - {0}", tree.exists("node_c") ? "true" : "false");
show_debug_message("Node \"node_a3\" exists - {0}", tree.exists("node_a3") ? "true" : "false");
show_debug_message("Node \"node_g\" exists - {0}", tree.exists("node_g") ? "true" : "false");
show_debug_message("\n");

show_debug_message("new Tree().remove(key); method");
tree.remove("node_a2");
show_debug_message("Remove \"node_a2\"");
show_debug_message(tree.to_string());

show_debug_message("new Tree().find(key); method");
var node = tree.find("node_d");
show_debug_message("Node \"node_d\" - key: {0}, value: {1}", node.key, node.value);
show_debug_message("Parent \"node_d\" - key: {0}, value: {1}", node.parent.key, node.parent.value);
show_debug_message("\n");
