extends Control
var toy
var partbutton = preload("res://src/menus/partbutton.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func set_toy(newtoy:Toy):
	for part in newtoy.parts:
		add_button(part)
	toy = newtoy
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func add_button(part:ToyPart):
	var button = partbutton.instantiate()
	button.set_part(part)
	$Buttons.add_child(part)

func _on_fix_button_pressed(part:ToyPart):
	toy.fix(part)
