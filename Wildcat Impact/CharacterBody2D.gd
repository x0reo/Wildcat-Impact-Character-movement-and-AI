extends CharacterBody2D

var maxspeed = 800
var speed = 400
	
func _physics_process(_delta: float)-> void:
	var combat_circle = get_parent().get_node("CombatCircle")
	var combat_circle_radius = get_parent().get_node("CombatCircle/CollisionShape2D")
	
	var target_position = Vector2(
		randf_range(combat_circle.position.x - combat_circle_radius, combat_circle.position.x + combat_circle_radius),
		randf_range(combat_circle.position.y - combat_circle_radius, combat_circle.position.y + combat_circle_radius)
	)
	
	move_and_slide()

