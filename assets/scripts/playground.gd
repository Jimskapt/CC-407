extends Node2D

func _ready():
	get_node('UI/game_version').text = ProjectSettings.get_setting('application/config/Version')
	
	var size = {
		'x': {
			'min': -2000,
			'max': 2000
		},
		'y': {
			'min': -2000,
			'max': 2000
		}
	}
	
	var meteor1 = load("res://assets/scenes/meteors/meteor1.tscn")
	var meteor2 = load("res://assets/scenes/meteors/meteor2.tscn")
	var meteor3 = load("res://assets/scenes/meteors/meteor3.tscn")
	var meteor4 = load("res://assets/scenes/meteors/meteor4.tscn")

	for i in range(1, 40):
		var clone1 = meteor1.instance()
		randomize()
		clone1.global_position = Vector2(rand_range(size.x.min, size.x.max), rand_range(size.y.min, size.y.max))
		clone1.name = 'meteor1_' + String(i)
		clone1.get_node('name').text = clone1.name
		
		var clone2 = meteor2.instance()
		randomize()
		clone2.global_position = Vector2(rand_range(size.x.min, size.x.max), rand_range(size.y.min, size.y.max))
		clone2.name = 'meteor2_' + String(i)
		clone2.get_node('name').text = clone2.name
		
		var clone3 = meteor3.instance()
		randomize()
		clone3.global_position = Vector2(rand_range(size.x.min, size.x.max), rand_range(size.y.min, size.y.max))
		clone3.name = 'meteor3_' + String(i)
		clone3.get_node('name').text = clone3.name
		
		var clone4 = meteor4.instance()
		randomize()
		clone4.global_position = Vector2(rand_range(size.x.min, size.x.max), rand_range(size.y.min, size.y.max))
		clone4.name = 'meteor4_' + String(i)
		clone4.get_node('name').text = clone4.name
		
		get_node('world/meteors').add_child(clone1)
		get_node('world/meteors').add_child(clone2)
		get_node('world/meteors').add_child(clone3)
		get_node('world/meteors').add_child(clone4)
