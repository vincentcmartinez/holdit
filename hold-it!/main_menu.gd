extends CanvasLayer
class_name MainMenu

@onready var hovered = false
@onready var pressed = false

func _physics_process(delta: float) -> void:
	if hovered and !pressed:
		$Sprite2D.play("hovered")
	elif !pressed:
		$Sprite2D.play("main_menu")

func _on_play_button_pressed() -> void:
	pressed = true
	$AudioStreamPlayer.stop()
	$VBoxContainer.queue_free()
	var move_tween = create_tween()
	move_tween.tween_property($Sprite2D, "global_position", Vector2(256,512), 1.5).set_trans(Tween.TRANS_CUBIC)
	await move_tween.finished
	$ColorRect.queue_free()
	get_tree().get_root().get_node("GameContainer").spawn_world()
	var fade_tween = create_tween()
	fade_tween.tween_property($BlackScreen, "modulate", Color(0,0,0,0), 2).set_trans(Tween.TRANS_CUBIC)
	await move_tween.finished
	queue_free()

func _on_timer_timeout() -> void:
	pass


func _on_play_mouse_entered() -> void:
	hovered = true


func _on_play_mouse_exited() -> void:
	hovered = false

func _on_texture_button_pressed() -> void:
	get_tree().quit()
