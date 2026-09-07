extends TileMapLayer
@export var moveby: Vector2
@export var speed: float
var currentpos
var trigger = false

func _ready() -> void:
	currentpos = global_position

func _physics_process(delta: float) -> void:
	if trigger == true:
		position = position.lerp(currentpos+moveby, speed * delta)


func _on_nextlevel_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		trigger = true
