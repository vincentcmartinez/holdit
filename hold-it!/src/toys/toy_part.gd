extends Node2D
class_name ToyPart
@onready var part_sprite = $Sprite2D

var valid : bool
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var rand : float = randf()
	if rand < 0.10:
		valid = false
		part_sprite.visible = false
	else:
		valid = true
	if not valid:
		var label = Label.new()
		label.text = "bruh"
		add_child(label)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass 
