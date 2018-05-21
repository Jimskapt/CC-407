extends KinematicBody2D

var way = Vector2(0, 0)
var type = 'trading_crate'

func _ready():
	set_process(true)

func _process(delta):
	var collision = move_and_collide(way)
	if collision:
		way = way.slide(collision.normal)
