extends TileMapLayer
@export var moveby: Vector2
@export var speed: float
var currentpos
var trigger = false
@export var time = 0

func _ready() -> void:
	currentpos = global_position

func _physics_process(delta: float) -> void:
	if trigger == true:
		await get_tree().create_timer(time).timeout
		position = position.lerp(currentpos+moveby, speed * delta)


func _on_booster_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		trigger = true
