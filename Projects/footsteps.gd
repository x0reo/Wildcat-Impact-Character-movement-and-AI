extends CPUParticles2D

func _ready():
	await(get_tree().create_timer(7))
	queue_free()
