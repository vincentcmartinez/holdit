extends Node2D
class_name ToySpawner
@onready var spawn_timer: Timer = $SpawnTimer

@onready var toy_car = preload("res://src/toys/car/toy_car.tscn")
@onready var toy_robot = preload("res://src/toys/robot/toy_robot.tscn")
@onready var toy_monkey = preload("res://src/toys/monkey/toy_monkey.tscn")
@onready var toy_dino = preload("res://src/toys/dino/toy_dino.tscn")
@onready var toys = [toy_dino, toy_monkey, toy_car]

func _physics_process(delta: float) -> void:
	pass

func _ready() -> void:
	SignalBus.connect("hold_it", _on_hold_it)
	SignalBus.connect("minigame_finished", _on_minigame_finished)

func spawn_random_toy():
	var toy = toys.pick_random().instantiate()
	add_child(toy)
	toy.apply_central_impulse(Vector2(200,-100))

func _on_spawn_timer_timeout() -> void:
	spawn_random_toy()

func _on_hold_it():
	spawn_timer.paused = true

func _on_minigame_finished(_paused):
	spawn_timer.paused = false
