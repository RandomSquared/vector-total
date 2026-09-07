extends CanvasGroup

@onready var color_rect: ColorRect = $ColorRect
@export var duration = 5

func _ready() -> void:
	self.modulate.a = 0
	
func _on_moveablemap_2_next_level() -> void:
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 1.0, duration / 2.0)
	await tween.finished
		

	get_tree().change_scene_to_file("res://level3-4.tscn")
