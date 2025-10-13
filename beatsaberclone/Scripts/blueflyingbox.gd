extends Node3D

@export var dir = Vector3(0, 0, 1)
@export var speed = 0.5
var location = -10

func _ready():
	# Add to the appropriate group based on color
	add_to_group("blue_cube")

	
func _process(delta):
	global_position += dir * (speed * delta)
func _on_rigid_body_entered(area):
	$"..".queue_free()
