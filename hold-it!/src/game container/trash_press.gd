extends Node2D

@onready var animated_sprite_2d: AnimatedSprite2D = $Node2D/AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $Node2D/Area2D/AnimationPlayer
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

@onready var timer = $Timer
var destroying = false
var activated = false
var success = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.connect("activate_destroy", _on_activate_destroy)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	# follow player x cursor
	if activated:
		position.x = get_global_mouse_position().x

func _input(event: InputEvent) -> void:
	if event.is_action_released("left_click") and activated:
		$AudioStreamPlayer.play()
		animated_sprite_2d.play("press_destroy")
		animation_player.play("destroy")
		audio_stream_player.play()
		await animation_player.animation_finished
		finish()

func _on_activate_destroy():
	timer.start()
	activated = true
	audio_stream_player.play()
	SignalBus.emit_signal("hold_it") # pause belt (for now)
	

func _on_timer_timeout() -> void:
	finish()

func finish():
	activated = false
	SignalBus.emit_signal("destroy_finished")
	SignalBus.emit_signal("minigame_finished",success)
	success = false
