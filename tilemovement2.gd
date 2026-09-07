extends TileMapLayer 
@export var moveby: Vector2
@export var speed: float
var currentpos
var trigger = false
signal next_level()

func _ready() -> void:
	currentpos = global_position

		

func _on_nextlevel_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		await get_tree().create_timer(2.0).timeout
		var tween = get_tree().create_tween()
		tween.set_trans(Tween.TRANS_QUAD)
		tween.set_ease(Tween.EASE_IN)
		tween.tween_property(self, "position", moveby, speed)
		next_level.emit()
