extends Node3D

@export var dir = Vector3(0, 0, 1)
@export var speed = 3
var location = -10
		
func _process(delta):
	global_position += dir * (speed * delta)
	
