/// @param {Any} value
function Tree(value = undefined) constructor {
	self.value = value;
	self.key = "root";
	
	layer = 0;
	parent = undefined;
	list = [];
	
	/// @param {String} key
	/// @param {Any} value
	/// @return {Undefined}
	static add = function(key, value = undefined) {
		var tree = new Tree(value);
		tree.key = key;
		tree.layer = layer + 1;
		tree.parent = self;
		array_push(list, tree);
		return tree;
	}
	
	/// @param {String} key
	/// @return {Struct.Tree}
	static find = function(key) {
		if (self.key == key) {
			return self;
		}
		
		for (var i = 0; i < array_length(list); i++) {
			if (list[i].find(key) != undefined) {
				return list[i].find(key);
			}
		}
		
		return undefined;
	}
	
	/// @param {String} key
	/// @return {Bool}
	static exists = function(key) {
		return find(key) != undefined;
	}
	
	/// @param {String} key
	/// @return {Undefined}
	static remove = function(key) {
		var target = find(key);
		array_delete(target.parent.list, target.get_index(), 1);
	}
	
	/// @return {Real}
	static get_index = function() {
		return array_find_index(parent.list, function(e) {
			return e.key == key;
		});
	}
	
	/// @return {String}
	static to_string = function() {
		var result = string("[{0}]: {1}\n", key, value);
		if (array_length(list) == 0) {
			return result;
		}
		
		for (var  i = 0; i < array_length(list); i++) {
			repeat(layer + 1) {
				result += "_ ";
			}
			result += list[i].to_string();
		}
		return result;
	}
}
