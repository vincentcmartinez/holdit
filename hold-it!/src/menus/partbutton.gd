class_name PartButton extends Button

var part
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	custom_minimum_size = Vector2(0,32)
	self.connect("button_pressed", _on_button_pressed)
	pass # Replace with function body.

func set_part(newpart:ToyPart):
	part = newpart
	return

func _on_button_pressed():
	SignalBus.emit_signal("fix_button_pressed", part)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
