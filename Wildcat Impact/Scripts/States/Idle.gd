extends State
class_name Idle

@export var off_field_char: CharacterBody2D

var player: CharacterBody2D

var move_direction : Vector2
var wander_time : float
var move_speed : float

func randomize_wander():
	move_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	wander_time = randf_range(1, 3)
	if decide_wander() > 0:
		move_speed = randf_range(150.0, 250.0)
	else:
		move_speed = 0.0
	
func Enter():
	player = get_tree().get_first_node_in_group("Player")
	randomize_wander()
	
func Update(delta: float)-> void:
	if wander_time > 0:
		wander_time -= delta
	
	else:
		randomize_wander()

func Physics_Update(_delta: float)-> void:
	if off_field_char:
		off_field_char.velocity = move_direction * move_speed
		
	var direction = player.global_position - off_field_char.global_position
	
	if direction.length() > 350:
		Transitioned.emit(self, "follow")

func decide_wander():
	return floor(randf_range(0, 4))
