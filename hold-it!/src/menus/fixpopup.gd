extends Control
var toy
var partbutton = preload("res://src/menus/partbutton.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.emit_signal("minigame_started")
	SignalBus.connect("fix_button_pressed", _on_fix_button_pressed)
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
	
	$Buttons.add_child(button)
	button.call_deferred("set_part",part)
func _on_fix_button_pressed(part:ToyPart):
	toy.fix(part)
	if toy.evaluate():
		SignalBus.emit_signal("minigame_finished")
		hide()
		queue_free()
