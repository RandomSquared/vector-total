extends Node2D

var time: float = 0.0
var original_y: float = 0.0
@export var oscspeed = 1
@export var amp = 300
@export var offset = 0

func _ready() -> void:
	original_y = position.y
	
func _physics_process(delta: float):
	time += delta
	position.y = original_y + sin(time * oscspeed + offset) * amp
