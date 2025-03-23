extends Node2D
class_name ToyPart
@onready var part_sprite = $Sprite2D
@export var path_to_icon:String
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
	if valid:
		SignalBus.emit_signal("minigame_finished",false)
	valid = true 
	part_sprite.show()
	if find_child("invalid"):
		find_child("invalid").hide()
	return

func set_invalid():
	valid = false
	part_sprite.hide()
	if find_child("invalid"):
		find_child("invalid").show()
	return

func get_icon() -> Texture2D:
	var texture = load(path_to_icon)
	return texture

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass 
