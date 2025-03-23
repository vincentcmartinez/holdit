extends Node2D
class_name ToySpawner
@onready var spawn_timer: Timer = $SpawnTimer

func start_game():
	$SpawnTimer.start()

func _physics_process(delta: float) -> void:
	$SpawnTimer.set_wait_time(get_parent().spawn_rate)
	pass

func _ready() -> void:
	SignalBus.connect("hold_it", _on_hold_it)
	SignalBus.connect("minigame_finished", _on_minigame_finished)

func spawn_random_toy():
	var toy = get_parent().toys.pick_random().instantiate()
	add_child(toy)
	toy.apply_central_impulse(Vector2(200,-100))

func _on_spawn_timer_timeout() -> void:
	spawn_random_toy()

func _on_hold_it():
	spawn_timer.paused = true

func _on_minigame_finished(_paused):
	spawn_timer.paused = false
