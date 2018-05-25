extends KinematicBody2D

signal use_loop_end

var life = 100
var max_life = 100
var ore = 0
var money = 0

func _ready():
	set_process(true)
	self.get_node('right_hand/tool').connect('use_loop_end', self, '_use_tool')

func get_mass():
	return 150 + self.ore

func _use_tool():
	self.ore += 1
	get_node('../../topcamera').way += Vector2(cos(self.rotation + PI / 2), sin(self.rotation + PI / 2)) * 0.5

func _process(delta):
	
	var pushers = {
		'left': false,
		'right': false,
		'down_right': false,
		'down_left': false,
		'top_right': false,
		'top_left': false
	}
	
	if (Input.is_action_pressed('shoot_right')):
		var space_state = get_world_2d().direct_space_state
		var see = Vector2(cos(self.rotation - PI / 2), sin(self.rotation - PI / 2))
		get_node('../raycast').set_point_position(0, self.position)
		get_node('../raycast').set_point_position(1, self.position + see * 35)
		var cast = space_state.intersect_ray(self.position, self.position + see * 35)
		if (cast):
			if (cast.collider.type == 'meteor'):
				self.get_node('right_hand/tool').emit_signal('use_loop_start')
			elif (cast.collider.type == 'trading_crate'):
				get_node('../../UI/trading_panel').show()
	
	if (Input.is_action_pressed('ui_right') && !Input.is_action_pressed('ui_left')):
		pushers.left = true
	
	if (Input.is_action_pressed('ui_left') && !Input.is_action_pressed('ui_right')):
		pushers.right = true
	
	if (Input.is_action_pressed('ui_up') && !Input.is_action_pressed('ui_down')):
		pushers.down_right = true
		pushers.down_left = true
	
	if (Input.is_action_pressed('ui_down') && !Input.is_action_pressed('ui_up')):
		pushers.top_right = true
		pushers.top_left = true
	
	if (Input.is_action_pressed('ui_roll_to_right') && !Input.is_action_pressed('ui_roll_to_left')):
		pushers.top_right = true
		pushers.down_left = true
	
	if (Input.is_action_pressed('ui_roll_to_left') && !Input.is_action_pressed('ui_roll_to_right')):
		pushers.down_right = true
		pushers.top_left = true
	
	if (pushers.left):
		get_node('left_push').show()
	else:
		get_node('left_push').hide()
	
	if (pushers.right):
		get_node('right_push').show()
	else:
		get_node('right_push').hide()
	
	if (pushers.down_right):
		get_node('down_push_right').show()
	else:
		get_node('down_push_right').hide()
	
	if (pushers.down_left):
		get_node('down_push_left').show()
	else:
		get_node('down_push_left').hide()
	
	if (pushers.top_right):
		get_node('top_push_right').show()
	else:
		get_node('top_push_right').hide()
	
	if (pushers.top_left):
		get_node('top_push_left').show()
	else:
		get_node('top_push_left').hide()
