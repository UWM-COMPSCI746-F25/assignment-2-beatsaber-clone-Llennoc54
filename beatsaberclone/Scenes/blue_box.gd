extends Node3D
func _on_area3D_body_entered(area):
	print("THIS IS THE SCENE BOX")
	$".".queue_free()
	queue_free()
	
