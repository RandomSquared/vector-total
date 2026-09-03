extends Sprite2D
@onready var player = %player
@export var horizmult = 0.2
@export var vertmult = 0.2

var start_global_position: Vector2

func _ready() -> void:
	start_global_position = global_position

func _process(delta: float) -> void:
	global_position.x = start_global_position.x + player.global_position.x * (1 - horizmult)
	global_position.y = start_global_position.y + player.global_position.y * (1 - vertmult)
