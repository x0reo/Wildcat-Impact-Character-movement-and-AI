extends Node2D

var target_cursor = load("res://Unit_Marker.png")

func _ready():
	Input.set_custom_mouse_cursor(target_cursor, Input.CURSOR_ARROW, Vector2(16, 16))
