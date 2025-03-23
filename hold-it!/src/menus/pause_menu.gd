extends CanvasLayer
class_name PauseMenu


func _on_continue_button_pressed() -> void:
	hide()
	get_tree().paused = false

func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _on_animated_sprite_2d_animation_finished() -> void:
	$AnimatedSprite2D.play("idle")
