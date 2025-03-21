extends RigidBody2D
class_name Toy


@onready var parts = $Parts # list of part objects, which each have validity
func _physics_process(delta: float) -> void:
	position.x += 1

func _ready() -> void:
	# init part validity, 1/25 chance defective
	for part in parts: 
		var rand : float = randf()
		if rand < 0.04:
			part.valid = false
		else:
			part.valid = true

func evaluate() -> bool:
	for part in parts:
		if not part.valid:
			return false
	return true
	
func fix(part: ToyPart) -> void:
	part.valid = true
