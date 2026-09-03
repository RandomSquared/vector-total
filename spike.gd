extends Area2D
signal killed()

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		killed.emit()
