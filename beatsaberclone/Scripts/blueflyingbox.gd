extends Node3D

@onready var timer: Timer = $Timer
@export var dir = Vector3(0, 0, 1)
@export var speed = 4
var location = -10

func _ready():
	timer.start()
	
func _process(delta):
	global_position += dir * (speed * delta)

func _on_timer_timeout():
	print("Blue is dead")
	queue_free()
