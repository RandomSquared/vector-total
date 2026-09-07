extends Node2D

var time: float = 0.0
var original_y: float = 0.0
var original_x: float = 0.0
@export var oscspeed = 1
@export var ampv = 300
@export var amph = 800
@export var offset: float = 0

func _ready() -> void:
	original_y = position.y
	original_x = position.x
	
func _physics_process(delta: float):
	time += delta
	position.y = original_y + sin(time * oscspeed + offset) * ampv
	position.x = original_x + cos(time * oscspeed + offset) * amph * -1
