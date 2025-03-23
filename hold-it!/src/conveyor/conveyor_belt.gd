extends StaticBody2D
class_name ConveyorBelt

@onready var animPlayer: AnimationPlayer = $AnimationPlayer
@onready var audioPlayer: AudioStreamPlayer2D = $AudioStreamPlayer2D
var audio: AudioStreamWAV = load("res://src/conveyor/conveyor.wav")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	audioPlayer.stream = audio
	start_anim(true)
	SignalBus.connect("hold_it", stop_anim)
	SignalBus.connect("minigame_finished", start_anim)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func start_anim(_passed):
	animPlayer.play("move")
	if not audioPlayer.playing:
		audioPlayer.play()
func stop_anim():
	animPlayer.stop()
	audioPlayer.stop()
