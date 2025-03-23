extends Node2D
class_name World

var paused = false

func _input(event):
	if event.is_action_pressed("ui_cancel") and not paused:
		get_tree().paused = true
		get_tree().get_root().get_node("GameContainer").spawn_pause_menu()
