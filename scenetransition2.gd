extends CanvasGroup

@onready var color_rect: ColorRect = $ColorRect
@export var duration = 5
signal checkpoint2()

func _ready() -> void:
	checkpoint2.emit()
	var tween = create_tween()
	tween.tween_property(color_rect, "modulate:a", 0.0, duration / 2.0)
	await tween.finished
	
	
