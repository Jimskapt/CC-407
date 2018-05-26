extends Sprite

signal use_loop_start
signal use_loop_impact
signal use_loop_end

var animated = false
var target

func _ready():
	self.connect('use_loop_start', self, '_use_tool')
	self.animated = false

func _use_tool(target):
	if (!self.animated):
		self.animated = true
		self.target = target
		get_node('use').play('animate')

func _on_use_animation_finished(anim_name):
	emit_signal('use_loop_end', self.target)
	self.animated = false
	self.target = null
