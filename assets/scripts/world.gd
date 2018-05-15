extends Node2D

var linear_speed = 0.05
var angular_speed = 0.2

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
	
	for i in range(2, 22):
		var clone1 = get_node('meteors/meteor1_0').duplicate()
		clone1.name = 'meteor1_' + str(i)
		randomize()
		clone1.global_position = Vector2(
			rand_range(size.x.min, size.x.max),
			rand_range(size.y.min, size.y.max)
		)
		
		var clone2 = get_node('meteors/meteor2_0').duplicate()
		clone2.name = 'meteor2_' + str(i)
		randomize()
		clone2.global_position = Vector2(
			rand_range(size.x.min, size.x.max),
			rand_range(size.y.min, size.y.max)
		)
		
		var clone3 = get_node('meteors/meteor3_0').duplicate()
		clone3.name = 'meteor3_' + str(i)
		randomize()
		clone3.global_position = Vector2(
			rand_range(size.x.min, size.x.max),
			rand_range(size.y.min, size.y.max)
		)
		
		get_node('meteors').add_child(clone1)
		get_node('meteors').add_child(clone2)
		get_node('meteors').add_child(clone3)

func _process(delta):
	"""
	if (Input.is_action_pressed('ui_right') && !Input.is_action_pressed('ui_left')):
		way.x = way.x + cos(rotation) * linear_speed
		way.y = way.y + sin(rotation) * linear_speed
	
	if (Input.is_action_pressed('ui_left') && !Input.is_action_pressed('ui_right')):
		way.x = way.x + cos(rotation - PI) * linear_speed
		way.y = way.y + sin(rotation - PI) * linear_speed
	
	if (Input.is_action_pressed('ui_up') && !Input.is_action_pressed('ui_down')):
		way.x = way.x + cos(rotation + PI / 2) * 2 * linear_speed
		way.y = way.y + sin(rotation + PI / 2) * 2 * linear_speed
	
	if (Input.is_action_pressed('ui_down') && !Input.is_action_pressed('ui_up')):
		way.x = way.x + cos(rotation + PI / 2) * 2 * linear_speed
		way.y = way.y + sin(rotation + PI / 2) * 2 * linear_speed
	
	if (Input.is_action_pressed('ui_roll_to_right') && !Input.is_action_pressed('ui_roll_to_left')):
		moment = moment + 2 * angular_speed
	
	if (Input.is_action_pressed('ui_roll_to_left') && !Input.is_action_pressed('ui_roll_to_right')):
		moment = moment - 2 * angular_speed
	"""
	
	if (Input.is_action_pressed('ui_right') && !Input.is_action_pressed('ui_left')):
		way.x = way.x - linear_speed
	
	if (Input.is_action_pressed('ui_left') && !Input.is_action_pressed('ui_right')):
		way.x = way.x + linear_speed
	
	if (Input.is_action_pressed('ui_up') && !Input.is_action_pressed('ui_down')):
		way.y = way.y + 2 * linear_speed
	
	if (Input.is_action_pressed('ui_down') && !Input.is_action_pressed('ui_up')):
		way.y = way.y - 2 * linear_speed
	
	if (Input.is_action_pressed('ui_roll_to_right') && !Input.is_action_pressed('ui_roll_to_left')):
		moment = moment - 2 * angular_speed
	
	if (Input.is_action_pressed('ui_roll_to_left') && !Input.is_action_pressed('ui_roll_to_right')):
		moment = moment + 2 * angular_speed
	
	"""
	var collision = get_node('../player').move_and_collide(way)
	if collision:
		way = way.slide(collision.normal)
		moment = 0
	else:
	"""
	get_node('../topcamera').offset = get_node('../topcamera').offset + way
	get_node('../topcamera').rotation_degrees = get_node('../topcamera').rotation_degrees + moment * delta
	"""
	rotate(deg2rad(moment * delta))
	translate(way)
	"""
