extends CanvasLayer
class_name MainMenu

func _on_play_button_pressed() -> void:
	get_tree().get_root().get_node("GameContainer").spawn_world()
	queue_free()

func _on_quit_button_pressed() -> void:
	get_tree().quit()
