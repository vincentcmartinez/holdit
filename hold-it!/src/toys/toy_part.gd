extends Node2D
class_name ToyPart
@onready var part_sprite = $Sprite2D
@onready var invalid_part_sprite = $invalid
var valid : bool
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var rand : float = randf()
	if rand < 0.10:
		valid = false
		part_sprite.visible = false
	else:
		valid = true
	pass # Replace with function body.

func set_valid():
	valid = true 
	part_sprite.show()
	if invalid_part_sprite:
		invalid_part_sprite.hide()
	return

func set_invalid():
	valid = false
	part_sprite.hide()
	if invalid_part_sprite:
		invalid_part_sprite.show()
	return

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass 
