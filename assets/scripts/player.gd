extends KinematicBody2D

func _ready():
	set_process(true)

func _process(delta):
	
	var pushers = {
		'left': false,
		'right': false,
		'down_right': false,
		'down_left': false,
		'top_right': false,
		'top_left': false
	}
	
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
		pushers.down_right = true
		pushers.top_left = true
	
	if (Input.is_action_pressed('ui_roll_to_left') && !Input.is_action_pressed('ui_roll_to_right')):
		pushers.top_right = true
		pushers.down_left = true
	
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
