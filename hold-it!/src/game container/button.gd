extends Node2D

@onready var sprite : AnimatedSprite2D 
@onready var paused : bool = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite = $AnimatedSprite2D
	SignalBus.connect("minigame_finished", _on_minigame_finished)
		
func _input(event):
	if(event.is_action_pressed("space") && !get_tree().paused && !paused):
		hold_it()
	if(event.is_action_pressed("left_click") && !get_tree().paused && !paused):
		var pos_diff = abs(get_viewport().get_mouse_position() - sprite.global_position)
		if(pos_diff.x <= 32 and pos_diff.y <= 32):
			hold_it()

func _on_minigame_finished():
	paused = false
	
func hold_it():
	sprite.play("pressed")
	SignalBus.emit_signal("hold_it")
	paused = true
