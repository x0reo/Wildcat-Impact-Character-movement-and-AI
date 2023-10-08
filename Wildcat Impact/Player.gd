extends CharacterBody2D

var maxspeed = 350
var speed = 250

@onready var position2D = $Marker2D

func _ready():
	$AnimationPlayer.play("Cherry_Idle")
		
func _physics_process(_delta: float)-> void:
	
	self.z_index = self.global_position.y
	
	var direction: Vector2 = Input.get_vector("left", "right", "up", "down")
	
	velocity.x = move_toward(velocity.x, maxspeed * direction.x, speed)
	velocity.y = move_toward(velocity.y, maxspeed * direction.y, speed)
	
	move_and_slide()
	
	if direction:
		if $AnimationPlayer.current_animation != "Cherry_BasicAttack":
			$AnimationPlayer.play("Cherry_Run")
			
		if direction.x > 0:
			position2D.scale.x = 1
		elif direction.x < 0:
			position2D.scale.x = -1
	else:
		if $AnimationPlayer.current_animation != "Cherry_BasicAttack":
			$AnimationPlayer.play("Cherry_Idle")
	
	if Input.is_action_just_pressed("basic_attack"):
		$AnimationPlayer.play("Cherry_BasicAttack")
	
	
