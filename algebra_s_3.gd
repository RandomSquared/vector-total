extends AudioStreamPlayer
var isfinished = false
	
func _ready() -> void:
	Global.checkpoint.connect(_oncheckpoint)
		
func _oncheckpoint(x):
	if x == 3:
		isfinished = true
		stream.loop_mode = AudioStreamWAV.LOOP_DISABLED


func _on_algebrac_2_finished() -> void:
	self.play()
