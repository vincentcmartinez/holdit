extends StaticBody2D
class_name ConveyorBelt

@onready var animPlayer: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animPlayer.play("move")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func toggleAnimation(boo: bool):
	if boo:
		animPlayer.play("move")
	else:
		animPlayer.stop()
