extends Node2D

func _ready():
	for i in range(2, 12):
		var clone1 = get_node('world/meteors/meteor1_0').duplicate()
		clone1.name = 'meteor1_' + str(i)
		randomize()
		clone1.global_position = Vector2(rand_range(0 + 50, 1025 - 50), rand_range(0 + 50, 600 - 50))
		
		var clone2 = get_node('world/meteors/meteor2_0').duplicate()
		clone2.name = 'meteor2_' + str(i)
		randomize()
		clone2.global_position = Vector2(rand_range(0 + 50, 1025 - 50), rand_range(0 + 50, 600 - 50))
		
		var clone3 = get_node('world/meteors/meteor3_0').duplicate()
		clone3.name = 'meteor3_' + str(i)
		randomize()
		clone3.global_position = Vector2(rand_range(0 + 50, 1025 - 50), rand_range(0 + 50, 600 - 50))
		
		get_node('world/meteors').add_child(clone1)
		get_node('world/meteors').add_child(clone2)
		get_node('world/meteors').add_child(clone3)
