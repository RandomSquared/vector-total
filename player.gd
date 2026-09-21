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
@export var is_zoom_override = false
@export var zoom_override = Vector2(0.08, 0.08)
@export var is_respawn_override = false
@export var respawn_override: Vector2
@export var sensitivity = 1.0
var end = false
var endstarted = false
@onready var end1 = $Node2D/end1
@onready var end2 = $Node2D/end2
@onready var end3 = $Node2D/end3
@onready var end4 = $Node2D/end4
@onready var end5 = $Node2D/end5
@onready var end6 = $Node2D/end6
@onready var end7 = $Node2D/end7
@onready var end8 = $Node2D/end8
@onready var end9 = $Node2D/end9
@onready var end10 = $Node2D/end10
signal finale()

func _ready() -> void:
	end1.hide()
	end2.hide()
	end3.hide()
	end4.hide()
	end5.hide()
	end6.hide()
	end7.hide()
	end8.hide()
	end9.hide()
	end10.hide()

func _physics_process(delta: float) -> void:
	#ensure momentum isnt built up
	if is_on_floor():
		velv = 0
	if is_on_wall():
		velh = 0
	if is_on_ceiling():
		velv = 0
	
	#movement bs
	if Input.get_axis("up", "down") != 0:
		verticality = Input.get_axis("up", "down")
	if Input.get_axis("left", "right") != 0:
		horizontality = Input.get_axis("left", "right")
		
	if Input.is_action_pressed("xcancel") and verticality != 0:
		horizontality = 0
	if Input.is_action_pressed("ycancel") and horizontality != 0:
		verticality = 0
	
	#ending
	if end == true:
		horizontality = 0
		verticality = 0
	
	if verticality != 0 and horizontality != 0:
		velh += horizontality * sin(45) * multh
		velv += verticality * sin(45) * multv
	else:
		velh += horizontality * multh
		velv += verticality * multv
		
	#gravity & drag & mults
	velv += gravity
	
	if end == true:
		velv = velv * (1-3*drag)
		velh = velh * (1-3*drag)
	else:
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
	var target_zoom_value = clamp(remap(totalvel, 0, 1000*sensitivity, 0.7, 0.4), 0.4, 0.7)
	var target_zoom_vector = Vector2(target_zoom_value, target_zoom_value)
	if is_zoom_override == false and end == false:
		camera.zoom = camera.zoom.lerp(target_zoom_vector, 0.1)
	elif is_zoom_override == true and end == false:
		camera.zoom = camera.zoom.lerp(zoom_override, 0.1)
	if end == true:
		camera.zoom = camera.zoom.lerp(Vector2(0.8, 0.8), 0.1)
	
	
	#restart
	if Input.is_action_just_pressed("restart") and end == false:
		self.position = respawn
	
	if is_respawn_override == true:
		respawn = respawn_override
	
	
	
	velocity = Vector2(velh, velv)
	move_and_slide()
	

#Checkpoint
func _on_checkpoint_1_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D or checkpointno == 1:
		respawn = Vector2(22975.07, 640)

#Death
func _on_killed() -> void:
	self.position = respawn
	velv = 0
	velh = 0
	


func _on_checkpoint_2_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D or checkpointno == 2:
		respawn = Vector2(0, -896.0)
		



func _on_checkpoint_3_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D or checkpointno == 3:
		respawn = Vector2(9152.0, -2560.0)



func _on_checkpoint_4_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D or checkpointno == 4:
		respawn = Vector2(21952.0, -2048.0)
		

func _on_checkpoint_5_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D or checkpointno == 5:
		respawn = Vector2(0, -896.0)
	
	
func _on_checkpoint_6_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D or checkpointno == 6:
		respawn = Vector2(7488.0, 264.0)
	


func _on_checkpoint_7_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D or checkpointno == 7:
		respawn = Vector2(13120.0, 2688.0)


func _on_end_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D and endstarted == false:
		end = true
		endstarted = true
		await get_tree().create_timer(4.0).timeout
		end1.show()
		await get_tree().create_timer(2.0).timeout
		end1.hide()
		end2.show()
		await get_tree().create_timer(2.0).timeout
		end2.hide()
		end3.show()
		await get_tree().create_timer(4.0).timeout
		end3.hide()
		end4.show()
		await get_tree().create_timer(2.0).timeout
		end4.hide()
		end5.show()
		await get_tree().create_timer(2.0).timeout
		end5.hide()
		end6.show()
		await get_tree().create_timer(4.0).timeout
		end6.hide()
		end7.show()
		await get_tree().create_timer(3.0).timeout
		end7.hide()
		end8.show()
		await get_tree().create_timer(4.0).timeout
		end8.hide()
		end9.show()
		await get_tree().create_timer(3.0).timeout
		end9.hide()
		end10.show()
		await get_tree().create_timer(2.0).timeout
		finale.emit()
