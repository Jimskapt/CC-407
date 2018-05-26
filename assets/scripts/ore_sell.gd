extends Button

var player
var price = 2

func _ready():
	self.text = '+ ' + str(self.price) + ' ' + tr('$')
	player = get_node('../../../../../../world/player')

func _on_pressed():
	if (player.ore > 0):
		player.ore -= 1
		player.money += self.price

func _on_draw():
	if (player.ore <= 0):
		self.disabled = true
	else:
		self.disabled = false
