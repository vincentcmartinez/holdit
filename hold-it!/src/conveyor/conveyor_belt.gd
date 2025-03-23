extends StaticBody2D
class_name ConveyorBelt

@onready var animPlayer: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animPlayer.play("move")
	SignalBus.connect("hold_it", stop_anim)
	SignalBus.connect("minigame_finished", start_anim)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func start_anim(_passed):
	animPlayer.play("move")
func stop_anim():
	animPlayer.stop()
