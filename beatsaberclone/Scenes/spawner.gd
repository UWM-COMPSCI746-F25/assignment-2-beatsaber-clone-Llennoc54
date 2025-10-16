extends Node3D
@onready var bluetimer = $bluetimer
@onready var redtimer = $redtimer

@onready var BlueCube = load("res://Scenes/BlueBox.tscn")
@onready var RedCube = load("res://Scenes/RedBox.tscn")

@export var x_range = Vector2(-1.0, 1.0)
@export var y_range = Vector2(0.5, 1.5)   

func _ready():
	start_blue_random_timer()
	start_red_random_timer()

func start_blue_random_timer():
	var wait_time = randf_range(0.5, 2.0)
	bluetimer.start(wait_time)
	
func start_red_random_timer():
	var wait_time = randf_range(0.5, 2.0)
	redtimer.start(wait_time)
	
func _on_bluetimer_timeout():
	var instance = BlueCube.instantiate()
	add_child(instance)
	
	instance.global_position = get_random_position()
	start_blue_random_timer()
	
func _on_redtimer_timeout():
	var instance = RedCube.instantiate()
	add_child(instance)
	
	instance.global_position = get_random_position()
	start_red_random_timer()

func get_random_position() -> Vector3:
	var random_x = randf_range(x_range.x, x_range.y)
	var random_y = randf_range(y_range.x, y_range.y)
	
	return Vector3(random_x, random_y, -15)
