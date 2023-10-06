extends CharacterBody2D

@onready var marker = $Unit_Marker

@export var move_speed := 150.0

func _on_selection_area_2d_selection_toggled(selection):
	
	var cam = get_parent().get_node("Camera2D")
	marker.visible = selection
	cam.tracking = selection
	
func _physics_process(delta):
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
