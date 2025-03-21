extends RigidBody2D
class_name Toy

@onready var paused : bool = false

func _ready():
	add_to_group("Toy")

func _physics_process(delta: float) -> void:
	if(!paused):
		position.x += 1

func pause():
	paused = true
	
	###
	### code to run minigame?
	###
