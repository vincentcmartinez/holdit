extends Node
var minigaming = false
var paused = false
var lives = 3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.connect("minigame_finished", stop_minigaming)
	SignalBus.connect("minigame_started", start_minigaming)
	SignalBus.connect("hold_it", pause)
	SignalBus.connect("life_lost", _decrement_lives)
	pass # Replace with function body.


func start_minigaming():
	minigaming = true
func stop_minigaming(_passed):
	paused = false
	minigaming = false
func pause():
	paused = true

func unpause():
	minigaming = false
	paused = false

func _decrement_lives():
	lives -= 1
