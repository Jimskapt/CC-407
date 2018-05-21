extends Label

func _ready():
	set_process(true)

func _process(delta):
	self.text = 'Money : ' + str(get_node('../../world/player').money) + '$'
