extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var way = Vector2(0, 0)
var moment = 0

func _ready():
	randomize()
	way = Vector2(rand_range(-1, 1), rand_range(-1, 1))
	rotation_degrees = rand_range(0, 360)
	moment = rand_range(-30, 30)
	set_process(true)

func _process(delta):
	var collision = move_and_collide(way)
	if collision:
		way = way.slide(collision.normal)
	else:
		rotation_degrees = rotation_degrees + delta * moment
