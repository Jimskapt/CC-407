extends Node2D

func _ready():
	pass

func _on_quit_game_button_up():
	get_tree().quit()

func _on_new_game_button_up():
	get_tree().change_scene('res://assets/scenes/playground.tscn')
