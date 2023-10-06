extends Camera2D

var player : CharacterBody2D

var camera_offset : Vector2 = Vector2(0, 0)
@onready var tracking = false

func _ready():
	pass
	
func _physics_process(delta):
	var player = get_parent().get_node("Player")
	
	if player and not tracking:
		global_position = player.global_position + camera_offset
		
	
