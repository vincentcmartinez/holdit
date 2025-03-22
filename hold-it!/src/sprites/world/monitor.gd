extends Sprite2D

@onready var animPlayer: AnimationPlayer = $AnimationPlayer
@export var type: Type = Type.stop
enum Type {stop, destroy}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if type == Type.stop:
		animPlayer.play("stop")
	else:
		animPlayer.play("destroy")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
