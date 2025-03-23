extends Node2D

@onready var sprite : AnimatedSprite2D 
@onready var paused : bool = false
@export var cooldown_s:int
var on_cooldown = false
var select_timer:Timer
var holditscene = preload("res://src/assets/hold_it_animatic.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite = $AnimatedSprite2D
	select_timer = Timer.new()
	select_timer.wait_time = 2
	select_timer.autostart = false
	add_child(select_timer)
	select_timer.connect("timeout", _on_select_timeout)
	SignalBus.connect("minigame_finished", _on_minigame_finished)
	SignalBus.connect("toy_selected",_on_toy_selected)

func _input(event):
	if on_cooldown:
		return
	if(event.is_action_pressed("space") && !get_tree().paused && !paused):
		hold_it()
	if(event.is_action_pressed("left_click") && !get_tree().paused && !paused):
		var pos_diff = abs(get_viewport().get_mouse_position() - sprite.global_position)
		if(pos_diff.x <= 32 and pos_diff.y <= 32):
			hold_it()

func _on_minigame_finished(passed):
	paused = false
	if not passed:
		cooldown()
	
func hold_it():
	$AudioStreamPlayer.play()
	sprite.play("pressed")
	SignalBus.emit_signal("hold_it")
	var animatic = holditscene.instantiate()
	add_child(animatic)
	paused = true
	start_select_timer()

func cooldown():
	on_cooldown = true
	sprite.play("malfunction")
	await get_tree().create_timer(cooldown_s).timeout
	on_cooldown = false
	sprite.play("idle")

func start_select_timer():
	select_timer.start()

func _on_toy_selected():
	select_timer.stop()

func _on_select_timeout():
	SignalBus.emit_signal("minigame_finished",false)
