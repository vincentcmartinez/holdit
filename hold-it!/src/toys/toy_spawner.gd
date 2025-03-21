extends Node2D
class_name ToySpawner

@onready var toy_robot = preload("res://src/toys/toy_robot.tscn")

@onready var toys = [toy_robot]

func _physics_process(delta: float) -> void:
	pass
	
func spawn_random_toy():
	var toy = toys.pick_random().instantiate()
	toy.global_position = self.global_position
	get_tree().get_root().get_node("GameContainer/World").add_child(toy)
	toy.apply_central_impulse(Vector2(200,-100))

func _on_spawn_timer_timeout() -> void:
	spawn_random_toy()
