extends Sprite

signal use_loop_start
signal use_loop_impact
signal use_loop_end

var animated = false

func _ready():
	self.connect('use_loop_start', self, '_use_tool')
	self.animated = false

func _use_tool():
	if (!self.animated):
		self.animated = true
		get_node('use').play('animate')

func _on_use_animation_finished(anim_name):
	emit_signal('use_loop_end')
	self.animated = false
