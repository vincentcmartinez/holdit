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
@onready var popup = preload("res://src/menus/fixpopup.tscn")

func _physics_process(delta: float) -> void:
	#if on_conveyor_belt:
		#position.x += 1
	return
func _ready() -> void:
	add_to_group("Toy")
	SignalBus.connect("hold_it", pause)
	#await get_tree().create_timer(0.5).timeout
	#spawn_cooldown = false
	return

func _input(event: InputEvent) -> void:
	if event.is_action_released("left_click"):
		if highlighted and can_be_selected():
			return # replace with popup menu
func evaluate():
	for part in parts:
		if not part.valid:
			SignalBus.emit_signal("life_lost")
	return true
	
func fix(part: ToyPart) -> void:
	part.valid = true
	if position.y > 500:
		queue_free()

func _on_conveyor_belt_area_area_exited(area: Area2D) -> void:
	evaluate()
func _on_conveyor_belt_area_area_entered(area: Area2D) -> void:
	spawn_cooldown = false
	if area is FinishLine:
		crossed_finish = true

func die():
	await get_tree().create_timer(1).timeout
	queue_free()
	pass # Replace with function body.


func pause():
	# for now
	open_panel()
	freeze = true
	

func unpause():
	freeze = false
	###
	### code to run minigame?
	###

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
	return not spawn_cooldown and not crossed_finish # can be selected as long as its not falling
	
func open_panel():
	var cur_popup = popup.instantiate()
	add_child(cur_popup)
