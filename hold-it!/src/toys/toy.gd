extends RigidBody2D
class_name Toy
@onready var base: Sprite2D = $Base

@onready var on_conveyor_belt : bool = true
@onready var evaluated:bool = false
@onready var paused : bool = false
@onready var parts = $Parts.get_children() # list of part objects, which each have validity
var spawn_cooldown = true
var highlighted = false
var crossed_finish = false
var speed = 0
@onready var popup = preload("res://src/menus/fixpopup.tscn")
var evil = false
func _physics_process(delta: float) -> void:
	position.x += speed
	return
func _ready() -> void:
	add_to_group("Toy")
	SignalBus.connect("hold_it", pause)
	SignalBus.connect("minigame_finished", unpause)
	#await get_tree().create_timer(0.5).timeout
	#spawn_cooldown = false
	return

func _input(event: InputEvent) -> void:
	if event.is_action_released("left_click") and GameInfo.paused:
		if highlighted and can_be_selected() and not GameInfo.destroying:
			SignalBus.emit_signal("toy_selected")
			open_panel()

func is_evil():
	return evil 

func evaluate():
	for part in parts:
		if not part.valid:
			return false
	return true
	
func fix(part: ToyPart) -> void:
	part.set_valid()

func _on_conveyor_belt_area_area_exited(area: Area2D) -> void:
	evaluate()
func _on_conveyor_belt_area_area_entered(area: Area2D) -> void:
	spawn_cooldown = false
	speed = 5
	if area is FinishLine:
		crossed_finish = true
		if not evaluate():
			SignalBus.emit_signal("life_lost")

func die():
	await get_tree().create_timer(0.1).timeout
	queue_free()
	pass # Replace with function body.


func pause():
	freeze = true
	speed = 0
	

func unpause(_passed):
	freeze = false
	speed = 5


func highlight():
	base.material.blend_mode = CanvasItemMaterial.BLEND_MODE_ADD
	highlighted = true
func unhighlight():
	base.material.blend_mode = CanvasItemMaterial.BLEND_MODE_MIX
	highlighted = false

func _on_mouse_entered() -> void:
	if not highlighted:
		if can_be_selected():
			highlight()
	pass # Replace with function body.

func _on_mouse_exited() -> void:
	if highlighted:
		unhighlight()

func can_be_selected() -> bool:
	return not spawn_cooldown and not crossed_finish and not GameInfo.minigaming# can be selected as long as its not falling
	
func open_panel():
	var cur_popup = popup.instantiate()
	cur_popup.set_toy(self)
	add_child(cur_popup)
