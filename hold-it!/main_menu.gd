extends CanvasLayer
class_name MainMenu

func _on_button_pressed() -> void:
	get_tree().get_root().get_node("GameContainer").spawn_world()
	queue_free()
