extends Button

func _ready():
	pass

func _on_pressed():
	get_node('../../../../trading_panel').hide()
