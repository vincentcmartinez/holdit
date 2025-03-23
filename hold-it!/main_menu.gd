extends CanvasLayer
class_name MainMenu


@onready var pressed = false

func _physics_process(delta: float) -> void:
	if !pressed:
		$Sprite2D.play("main_menu")

func _on_play_button_pressed() -> void:
	pressed = true
	$VBoxContainer.queue_free()
	$Sprite2D.play("hide_screen")
	$Timer.start()

func _on_timer_timeout() -> void:
	get_tree().get_root().get_node("GameContainer").spawn_world()
	queue_free()
