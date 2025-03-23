class_name PartButton extends Button
@onready var texture_rect: TextureRect = $TextureRect

var part
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	custom_minimum_size = Vector2(0,32)
	self.connect("pressed", _on_button_pressed)
	pass # Replace with function body.

func set_part(newpart:ToyPart):
	part = newpart
	texture_rect.texture = part.get_icon()
	texture_rect.scale = Vector2(1,1)
	#add_child(part.part_sprite.duplicate(DUPLICATE_USE_INSTANTIATION))
	return

func _on_button_pressed():
	SignalBus.emit_signal("fix_button_pressed", part)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_mouse_entered() -> void:
	scale = Vector2(1.1,1.1)
	pass # Replace with function body.


func _on_mouse_exited() -> void:
	scale = Vector2(1,1)
	pass # Replace with function body.
