extends CanvasLayer

@onready var sprite : AnimatedSprite2D 
@onready var paused : bool = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite = $AnimatedSprite2D
		
func _input(event):
	if(event.is_action_pressed("space") && !get_tree().paused && !paused):
		sprite.play("pressed")
		get_tree().call_group("Toy", "pause")
		paused = true
	if(event.is_action_pressed("left_click") && !get_tree().paused && !paused):
		var pos_diff = abs(get_viewport().get_mouse_position() - sprite.global_position)
		if(pos_diff.x <= 32 and pos_diff.y <= 32):
			sprite.play("pressed")
			get_tree().call_group("Toy", "pause")
			paused = true
