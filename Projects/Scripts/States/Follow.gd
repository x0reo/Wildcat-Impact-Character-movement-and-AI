extends State
class_name Follow

@export var off_field_character: CharacterBody2D
@export var move_speed := 250.0

var player: CharacterBody2D

func Enter():
	player = get_tree().get_first_node_in_group("Player")

func Physics_Update(delta: float):
	var direction = player.global_position - off_field_character.global_position
	
	if direction.length() < 200:
		off_field_character.velocity = Vector2()
		Transitioned.emit(self, "idle")
	else:	
		off_field_character.velocity = direction.normalized() * move_speed
		
