extends XRController3D
@export var RAY_LENGTH = 1.0
var last_pos = Vector3.ZERO
var grabbed_object = null
var velocity = Vector3.ZERO
var origin = global_position
var dir = global_basis.z*-1
var end = origin + (dir * RAY_LENGTH)
var query = PhysicsRayQueryParameters3D.create(origin, end)
var collision_enabled = true

func _ready():
	last_pos = global_position

func _process(delta):
	if grabbed_object:
		grabbed_object.global_position = global_position
	
	velocity = (global_position - last_pos) / delta
		
	last_pos = global_position
func _physics_process(delta):
	
	var space_state = get_world_3d().direct_space_state
	origin = global_position
	dir = global_basis.z*-1
	end = origin + (dir * RAY_LENGTH)
	query = PhysicsRayQueryParameters3D.create(origin, end)
	query.collide_with_areas = collision_enabled
	
	if collision_enabled:
		var result = space_state.intersect_ray(query)
		if result:
			print("Right collision with ", result.collider.name)
			var name = result.collider.name
			if name == "RedCollision":
				$AudioStreamPlayer3D.play()
				result.collider.queue_free()

	$"RedSaber".points[0] = origin
	$"RedSaber".points[1] = end
	
func _on_area_3d_area_entered(area):
	pass
func _on_area_3d_area_exited(area):
	grabbed_object = null

func _on_button_pressed(name):
	if name == 'ax_button':
		$'RedSaber'.visible = !$'RedSaber'.visible
		print('BUTTON PRESSED')
		collision_enabled = !collision_enabled
		query.collide_with_areas = collision_enabled
