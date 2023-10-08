extends Camera2D

var player : CharacterBody2D

var camera_offset : Vector2 = Vector2(0, 0)
@onready var tracking = false

var targetedEnemy = null

func setTargetedEnemy(enemy):
	targetedEnemy = enemy

func getTargetedEnemy():
	return targetedEnemy

func _ready():
	pass
	
func _physics_process(_delta: float)-> void:
	player = get_parent().get_node("Player")
	
	if player and not tracking:
		global_position = player.global_position + camera_offset
	if player and tracking:
		global_position = (player.global_position + getTargetedEnemy().global_position) / 2
	
