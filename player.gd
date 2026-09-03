extends CharacterBody2D

@export var gravity = 10
@export var drag = 0.01
var verticality = 0
var horizontality = 0
var velh = 0
var velv = 0
@export var multh = 10
@export var multv = 10
@onready var pivot = $pivot
@onready var camera = $Camera
var targetzoom = 1
var zoomchange = 0
var multz = 1
var respawn = Vector2(0, 0)
@export var checkpointno = 0


func _physics_process(delta: float) -> void:
	#ensure momentum isnt built up
	if is_on_floor():
		velv = 0
	if is_on_wall():
		velh = 0
	
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
		
	#camerawork
	var totalvel = abs(velv) + abs(velh)
	var target_zoom_value = clamp(remap(totalvel, 0, 1000, 1.0, 0.5), 0.5, 1)
	var target_zoom_vector = Vector2(target_zoom_value, target_zoom_value)
	camera.zoom = camera.zoom.lerp(target_zoom_vector, 0.1)

	
	
	#restart
	if Input.is_action_just_pressed("restart"):
		self.position = respawn
	
	
	velocity = Vector2(velh, velv)
	move_and_slide()

#Checkpoint
func _on_checkpoint_1_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D or checkpointno == 1:
		respawn = Vector2(22975.07, 640)

#Death
func _on_killed() -> void:
	self.position = respawn
