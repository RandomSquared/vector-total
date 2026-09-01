extends CharacterBody2D

@export var gravity = 10
@export var drag = 0.01
var verticality = 0
var horizontality = 0
var velh = 0
var velv = 0
@export var multh = 10
@export var multv = 15
@onready var pivot = $pivot

func _physics_process(delta: float) -> void:
	#movement bs
	
	if Input.get_axis("up", "down") != 0:
		verticality = Input.get_axis("up", "down")
	if Input.get_axis("left", "right") != 0:
		horizontality = Input.get_axis("left", "right")
		
	if Input.is_action_pressed("xcancel") and verticality != 0:
		horizontality = 0
	if Input.is_action_pressed("ycancel") and horizontality != 0:
		verticality = 0
	
	if verticality != 0 and horizontality != 0:
		velh += horizontality * sin(45) * multh
		velv += verticality * sin(45) * multv
	else:
		velh += horizontality * multh
		velv += verticality * multv
		
	#gravity & drag & mults
	if not is_on_floor():
		velv += gravity
	velv = velv * (1-drag)
	velh = velh * (1-drag)
	
	
	
	#arrow rotation
	var direction = Vector2(horizontality, verticality)
	var angle = direction.angle()
	pivot.rotation = angle
	if direction == Vector2(0, 0):
		pivot.hide()
	else:
		pivot.show()
	
	
	
	velocity = Vector2(velh, velv)
	move_and_slide()
