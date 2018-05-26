extends Button

var player
var price = 10

func _ready():
	self.text = '- ' + str(self.price) + ' ' + tr('$')
	player = get_node('../../../../../../world/player')

func _on_pressed():
	if (player.money >= self.price && player.life < player.max_life):
		player.money -= self.price
		player.life += 5
		if (player.life > player.max_life):
			player.life = player.max_life

func _on_draw():
	if (player.life >= player.max_life || player.money < self.price):
		self.disabled = true
	else:
		self.disabled = false
