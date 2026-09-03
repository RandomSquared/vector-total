extends AudioStreamPlayer
var isfinished = false


func _on_algebrac_1_finished() -> void:
	self.play()



func _on_checkpoint_1_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		stream.loop_mode = AudioStreamWAV.LOOP_DISABLED
		isfinished = true
