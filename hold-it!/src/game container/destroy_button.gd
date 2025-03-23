extends Node2D

@onready var sprite : AnimatedSprite2D 
@onready var paused : bool = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite = $AnimatedSprite2D
	SignalBus.connect("destroy_finished", _on_destroy_finished)
		
func _input(event):
	if(event.is_action_pressed("x") && !get_tree().paused && !paused):
		activate_destroy()
	if(event.is_action_pressed("left_click") && !get_tree().paused && !paused):
		var pos_diff = abs(get_viewport().get_mouse_position() - sprite.global_position)
		if(pos_diff.x <= 32 and pos_diff.y <= 32):
			activate_destroy()

func _on_destroy_finished():
	paused = false
	
func activate_destroy():
	sprite.play("pressed")
	SignalBus.emit_signal("activate_destroy")
	print("destroy btn pressed")
	paused = true
