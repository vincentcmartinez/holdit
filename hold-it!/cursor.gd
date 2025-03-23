extends Sprite2D
class_name Cursor

func _physics_process(delta: float) -> void:
	global_position = get_global_mouse_position()
	if Input.is_action_pressed("left_click"):
		frame = 1
	else:
		frame = 0
