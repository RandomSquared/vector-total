extends RichTextLabel
@onready var player = %player
var opac = 0
@export var rate = 300


func _ready() -> void:
	self.modulate.a = 0
	
func _process(delta: float) -> void:
	opac = ((player.global_position.x - self.global_position.x)+(player.global_position.y - self.global_position.y)) / rate
	opac = clamp(opac, 0, 1)
	self.modulate.a = opac
