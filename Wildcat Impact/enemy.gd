extends CharacterBody2D

@onready var marker = $Unit_Marker
@onready var camera : Camera2D
@onready var player : CharacterBody2D
@onready var target : bool

@export var move_speed := 150.0

func _ready():
	marker.visible = false
	target = false

func _on_selection_area_2d_selection_toggled(selection):
	
	camera = get_parent().get_node("Camera2D")
	marker.visible = selection
	camera.tracking = selection
	
func _physics_process(_delta: float)-> void:
	var camera = get_parent().get_node("Camera2D")
	var player = get_parent().get_node("Player")
	
	if camera.tracking and marker.visible:
		camera.global_position = (player.global_position + self.global_position) / 2
		
	var direction = player.global_position - global_position
	
	if direction.length() < 2000:
		velocity = direction.normalized() * move_speed
		move_and_slide()
	else:	
		velocity = Vector2()
