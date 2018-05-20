extends ProgressBar

func _ready():
	set_process(true)

func _process(delta):
	self.value = get_node('../../world/player').life
