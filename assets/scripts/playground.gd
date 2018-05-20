extends Node2D

func _ready():
	for i in range(1, 9):
		var clone1 = get_node('world/meteors/meteor1_0').duplicate()
		randomize()
		clone1.global_position = Vector2(rand_range(0 + 50, 1025 - 50), rand_range(0 + 50, 600 - 50))
		clone1.name = 'meteor1_' + String(i)
		clone1.get_node('name').text = clone1.name
		
		var clone2 = get_node('world/meteors/meteor2_0').duplicate()
		randomize()
		clone2.global_position = Vector2(rand_range(0 + 50, 1025 - 50), rand_range(0 + 50, 600 - 50))
		clone2.name = 'meteor2_' + String(i)
		clone2.get_node('name').text = clone2.name
		
		var clone3 = get_node('world/meteors/meteor3_0').duplicate()
		randomize()
		clone3.global_position = Vector2(rand_range(0 + 50, 1025 - 50), rand_range(0 + 50, 600 - 50))
		clone3.name = 'meteor3_' + String(i)
		clone3.get_node('name').text = clone3.name
		
		get_node('world/meteors').add_child(clone1)
		get_node('world/meteors').add_child(clone2)
		get_node('world/meteors').add_child(clone3)
