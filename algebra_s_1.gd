extends AudioStreamPlayer
var isfinished = false
@export var pushallsignals = false
@export var pushno: int = 1

func _ready() -> void:
	Global.checkpoint.connect(_oncheckpoint)
	
	if pushallsignals == true:
		for i in range(pushno):
			Global.checkpoint.emit(i)
			print("pushed")
	
func _on_algebrac_1_finished() -> void:
	self.play()

		
func _oncheckpoint(x):
	if x == 1:
		stream.loop_mode = AudioStreamWAV.LOOP_DISABLED
		isfinished = true
