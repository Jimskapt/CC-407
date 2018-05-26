extends Label

func _ready():
	set_process(true)

func _process(delta):
	self.text = str(get_node('../../../world/player').get_mass()) + tr('lb')
