extends AudioStreamPlayer
var isfinished = false

func _on_checkpoint_1_body_entered(body: Node2D) -> void:
	isfinished = true



func _on_algebras_1_finished() -> void:
	self.play()
