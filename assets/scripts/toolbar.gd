extends Node2D

var last_roll = 0
var selected_tool = 0
var selected_tool_texture = preload('res://assets/textures/kenney_uipack-space/PNG/metalPanel_red.png')
var unselected_tool_texture = preload('res://assets/textures/kenney_uipack-space/PNG/metalPanel.png')

func _ready():
	refresh_current_tool()
	pass

func _input(event):
	if (event is InputEventMouseButton && (OS.get_ticks_msec() - last_roll) > 30):
		if (event.button_index == BUTTON_WHEEL_DOWN && selected_tool < 9):
			selected_tool = selected_tool + 1
		if (event.button_index == BUTTON_WHEEL_UP && selected_tool > 0):
			selected_tool = selected_tool - 1
		last_roll = OS.get_ticks_msec()
		refresh_current_tool()

func refresh_current_tool():
	for i in range(0, 10):
		if (i == selected_tool):
			get_node(str(i) + '/background').set_texture(selected_tool_texture)
		else:
			get_node(str(i) + '/background').set_texture(unselected_tool_texture)