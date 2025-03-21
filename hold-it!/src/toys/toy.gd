extends RigidBody2D
class_name Toy

@onready var on_conveyor_belt : bool = false

func _physics_process(delta: float) -> void:
	if on_conveyor_belt:
		position.x += 1
	if position.y > 500:
		queue_free()

func _on_conveyor_belt_area_area_entered(area: Area2D) -> void:
	on_conveyor_belt = true

func _on_conveyor_belt_area_area_exited(area: Area2D) -> void:
	on_conveyor_belt = false
