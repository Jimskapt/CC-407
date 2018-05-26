extends Node2D

func _ready():
	get_node('game_name').text = ProjectSettings.get_setting('application/config/name')
	get_node('game_version').text = tr('VERSION') + ' ' + ProjectSettings.get_setting('application/config/Version')

func _on_quit_game_button_up():
	get_tree().quit()

func _on_new_game_button_up():
	get_tree().change_scene('res://assets/scenes/playground.tscn')
