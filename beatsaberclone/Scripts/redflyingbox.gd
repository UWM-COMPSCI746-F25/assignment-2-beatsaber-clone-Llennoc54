extends Node3D

@export var dir = Vector3(0, 0, 1)
@export var speed = 0.5
var location = -10
func _ready():
	# Add to the appropriate group based on color
	add_to_group("red_cube")
	$Area3D.collision_layer = 2  # Layer 2 for red cubes
	$Area3D.collision_mask = 2   # Only collide with layer 2
		
func _process(delta):
	global_position += dir * (speed * delta)
	
func _on_area_3d_area_entered(area):
	self.queue_free()
