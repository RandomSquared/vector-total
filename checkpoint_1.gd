extends Area2D
@onready var sprite = $checkpointsprite1
@onready var particle1 = $suck1
@onready var particle2 = $explode1
@onready var timer = $timer1
@onready var timer2 = $timer2
var new_texture = preload("res://checkpoint-a.png")
var hasbeen = false


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D and hasbeen == false:
		timer.start()
		particle1.emitting = true
		hasbeen = true



func _on_timer_1_timeout() -> void:
	particle1.emitting = false
	particle2.emitting = true
	sprite.texture = new_texture
	timer2.start()

func _on_timer_2_timeout() -> void:
	particle2.emitting = false
