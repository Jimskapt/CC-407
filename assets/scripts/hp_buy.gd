extends Button

var player

func _ready():
	player = get_node('../../../../../../world/player')

func _on_pressed():
	if (player.money >= 10 && player.life < player.max_life):
		player.money -= 10
		player.life += 5
		if (player.life > player.max_life):
			player.life = player.max_life

func _on_draw():
	if (player.life >= player.max_life || player.money < 10):
		self.disabled = true
	else:
		self.disabled = false
