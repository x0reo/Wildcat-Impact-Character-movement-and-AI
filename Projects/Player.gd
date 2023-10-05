extends CharacterBody2D

@export var footsteps : PackedScene

var maxspeed = 350
var speed = 250

@onready var position2D = $Marker2D

func _ready():
	$AnimationPlayer.play("Cherry_Idle")
	
func _physics_process(_delta: float)-> void:
	var direction: Vector2 = Input.get_vector("left", "right", "up", "down")
	
	velocity.x = move_toward(velocity.x, maxspeed * direction.x, speed)
	velocity.y = move_toward(velocity.y, maxspeed * direction.y, speed)
	
	move_and_slide()
	
	if velocity.length() > 0:
		$AnimationPlayer.play("Cherry_Run")
	else:
		$AnimationPlayer.play("Cherry_Idle")

	
	if direction.x > 0:
		position2D.scale.x = 1
	elif direction.x < 0:
		position2D.scale.x = -1
	
	
