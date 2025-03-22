extends Node
var minigaming = false
var paused = false
var lives = 3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.connect("minigame_finished", _toggle_minigaming)
	SignalBus.connect("minigame_started", _toggle_minigaming)
	SignalBus.connect("hold_it", pause)
	SignalBus.connect("life_lost", _decrement_lives)
	pass # Replace with function body.

func _toggle_minigaming():
	if minigaming:
		paused = false
	minigaming = not minigaming

func pause():
	paused = true

func unpause():
	minigaming = false
	paused = false

func _decrement_lives():
	lives -= 1
