extends CanvasGroup

@onready var color_rect: ColorRect = $ColorRect
@export var duration = 4

func _ready() -> void:
	self.modulate.a = 0
	
func _on_player_finale() -> void:
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 1.0, duration / 2.0)
	await tween.finished
	Global.checkpoint.emit(7)
