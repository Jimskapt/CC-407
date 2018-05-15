extends Camera2D

var linear_speed = 0.05
var angular_speed = 0.4

var way = Vector2(0, 0)
var moment = 0
var size = {
	'x': {
		'min': -4000,
		'max': 4000
	},
	'y': {
		'min': -4000,
		'max': 4000
	}
}

func _ready():
	set_process(true)
	
	get_node('../world/background').rect_position = Vector2(size.x.min, size.y.min)
	get_node('../world/background').rect_size = Vector2(size.x.max - size.x.min, size.y.max - size.y.min)
	
	for i in range(1, 10):
		var clone1 = get_node('../world/meteors/meteor1_0').duplicate()
		clone1.name = 'meteor1_' + str(i)
		randomize()
		clone1.global_position = Vector2(
			rand_range(size.x.min, size.x.max),
			rand_range(size.y.min, size.y.max)
		)
		
		var clone2 = get_node('../world/meteors/meteor2_0').duplicate()
		clone2.name = 'meteor2_' + str(i)
		randomize()
		clone2.global_position = Vector2(
			rand_range(size.x.min, size.x.max),
			rand_range(size.y.min, size.y.max)
		)
		
		var clone3 = get_node('../world/meteors/meteor3_0').duplicate()
		clone3.name = 'meteor3_' + str(i)
		randomize()
		clone3.global_position = Vector2(
			rand_range(size.x.min, size.x.max),
			rand_range(size.y.min, size.y.max)
		)
		
		get_node('../world/meteors').add_child(clone1)
		get_node('../world/meteors').add_child(clone2)
		get_node('../world/meteors').add_child(clone3)

func _process(delta):
	if (Input.is_action_pressed('ui_right') && !Input.is_action_pressed('ui_left')):
		way = way + Vector2(cos(rotation), sin(rotation)) * linear_speed
	
	if (Input.is_action_pressed('ui_left') && !Input.is_action_pressed('ui_right')):
		way = way + Vector2(cos(rotation + PI), sin(rotation + PI)) * linear_speed
	
	if (Input.is_action_pressed('ui_up') && !Input.is_action_pressed('ui_down')):
		way = way + Vector2(cos(rotation - PI / 2), sin(rotation - PI / 2)) * 2 * linear_speed
	
	if (Input.is_action_pressed('ui_down') && !Input.is_action_pressed('ui_up')):
		way = way + Vector2(cos(rotation + PI / 2), sin(rotation + PI / 2)) * 2 * linear_speed
	
	if (Input.is_action_pressed('ui_roll_to_right') && !Input.is_action_pressed('ui_roll_to_left')):
		moment = moment + 2 * angular_speed
	
	if (Input.is_action_pressed('ui_roll_to_left') && !Input.is_action_pressed('ui_roll_to_right')):
		moment = moment - 2 * angular_speed
	
	var collision = get_node('../world/player').move_and_collide(way)
	if collision:
		way = way.slide(collision.normal)
		moment = 0
	else:
		get_node('../world/player').rotation_degrees = get_node('../world/player').rotation_degrees + moment * delta
	
	"""
	offset = offset + way
	rotation_degrees = rotation_degrees + moment * delta
	"""
	offset = get_node('../world/player').global_position - Vector2(1025/2, 600/2)
	rotation_degrees = get_node('../world/player').rotation_degrees
	"""
	rotate(deg2rad(moment * delta))
	translate(way)
	"""
