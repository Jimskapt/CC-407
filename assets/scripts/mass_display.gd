extends Label

func _ready():
	set_process(true)

func _process(delta):
	self.text = 'Mass : ' + str(get_node('../../world/player').get_mass()) + 'kg'
