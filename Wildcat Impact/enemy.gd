extends CharacterBody2D

@onready var marker = $Unit_Marker
@onready var camera : Camera2D
@onready var player : CharacterBody2D

@export var move_speed := 150.0

func _ready():
	marker.visible = false
	camera = get_parent().get_node("Camera2D")
	player = get_parent().get_node("Player")
	
func _on_selection_area_2d_selection_toggled(selection):
	
	marker.visible = selection
	camera.tracking = selection
	
	if selection:
		camera.setTargetedEnemy(self)
		player.setTargetedEnemy(self)
	
func _physics_process(_delta: float)-> void:
		
	var direction = player.global_position - global_position
	
	if direction.length() < 2000:
		velocity = direction.normalized() * move_speed
		move_and_slide()
	else:	
		velocity = Vector2()
