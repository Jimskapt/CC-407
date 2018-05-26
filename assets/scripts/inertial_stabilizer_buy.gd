extends Button

var price = 100

func _ready():
	self.text = '- ' + str(self.price) + ' ' + tr('$')

func _on_draw():
	self.disabled = true
