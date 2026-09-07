extends TileMapLayer
@export var moveby: Vector2
@export var speed: float
var currentpos
var trigger = false
signal next_level()

func _ready() -> void:
	currentpos = global_position
	trigger = true

func _physics_process(delta: float) -> void:
	if trigger == true:
		position = position.lerp(currentpos+moveby, speed * delta)
		
