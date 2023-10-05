extends CharacterBody2D

var maxspeed = 800
var speed = randf_range(200, 450)

@onready var position2D = $Marker2D

func _ready():
	pass

func _physics_process(delta):
	var Player = get_parent().get_node("Player")
	move_and_slide()
	
	if velocity.length() > 0:
		$AnimationPlayer.play("Cherry_Run")
	else:
		$AnimationPlayer.play("Cherry_Idle")
	
	if velocity.x > 0:
		position2D.scale.x = 1
	elif velocity.x < 0:
		position2D.scale.x = -1
