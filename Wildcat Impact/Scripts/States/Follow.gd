extends State
class_name Follow

@export var off_field_character: CharacterBody2D
@export var min_move_speed := 230.0
@export var max_move_speed := 400.0

var move_speed

var player: CharacterBody2D

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	move_speed = randf_range(min_move_speed, max_move_speed)

func Physics_Update(_delta: float)-> void:
	var direction = player.global_position - off_field_character.global_position
	
	if direction.length() < 300:
		off_field_character.velocity = Vector2()
		Transitioned.emit(self, "idle")
	else:	
		off_field_character.velocity = direction.normalized() * move_speed
		
	if direction.length() > 2000:
		off_field_character.global_position = player.global_position

