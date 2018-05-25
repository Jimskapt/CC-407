extends Camera2D

var linear_speed = 0.05
var angular_speed = 0.4

var way = Vector2(0, 0)
var moment = 0
var size = {
	'x': {
		'min': -2000,
		'max': 2000
	},
	'y': {
		'min': -2000,
		'max': 20000
	}
}

func _ready():
	set_process(true)
	get_node('../world/background').rect_position = Vector2(size.x.min, size.y.min)
	get_node('../world/background').rect_size = Vector2(size.x.max - size.x.min, size.y.max - size.y.min)

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
		var damage = way.length() * get_node('../world/player').get_mass() / 150.0
		if (damage >= 2.0):
			get_node('../world/player').life -= damage * 4
		way = way.slide(collision.normal)
		moment = 0
	else:
		get_node('../world/player').rotation_degrees = get_node('../world/player').rotation_degrees + moment * delta
	
	self.offset = get_node('../world/player').global_position - Vector2(1025/2, 600/2)
	self.rotation_degrees = get_node('../world/player').rotation_degrees
