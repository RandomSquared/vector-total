extends AudioStreamPlayer
var isfinished = false
@export var duration = 4

func _on_checkpoint_1_body_entered(body: Node2D) -> void:
	isfinished = true



func _on_algebras_1_finished() -> void:
	self.play()
	



func _on_moveablemap_2_next_level() -> void:
	var tween = create_tween()
	tween.tween_property(self, "volume_db", -30.0, duration).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
