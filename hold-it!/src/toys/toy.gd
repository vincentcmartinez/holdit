extends RigidBody2D
class_name Toy

@onready var on_conveyor_belt : bool = true
@onready var evaluated:bool = false
@onready var paused : bool = false
@onready var parts = $Parts.get_children() # list of part objects, which each have validity
func _physics_process(delta: float) -> void:
	#if on_conveyor_belt:
		#position.x += 1
	return
func _ready() -> void:
	add_to_group("Toy")
	return

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


func die():
	await get_tree().create_timer(1).timeout
	queue_free()
	pass # Replace with function body.



func _physics_process(delta: float) -> void:
	if(!paused):
		position.x += 1

func pause():
	paused = true
	
	###
	### code to run minigame?
	###
