extends Button

var player

func _ready():
	player = get_node('../../../../../../world/player')

func _on_pressed():
	if (player.ore > 0):
		player.ore -= 1
		player.money += 10

func _on_draw():
	if (player.ore <= 0):
		self.disabled = true
	else:
		self.disabled = false
