extends Node2D

var press_speed = 200.0

var start_position: Vector2
var end_position: Vector2

var press_amplitude = 100.0  # How far the press moves down
var press_duration = 1.0     # Time (in seconds) to complete the motion
var time_elapsed = 0.0       # Tracks elapsed time
var moving_down = false           # State to indicate if the press is moving down
var moving_up = false				# Press is moving up?

func _ready():
	start_position = position
	end_position = position + Vector2(0, press_amplitude)
	
func _process(delta):
	if moving_down and not moving_up:
		time_elapsed += delta

		# Calculate progress as a normalized value between 0 and 1
		var progress = time_elapsed / press_duration

		if progress >= 1.0:
			# If the motion is complete, snap to the start position and stop
			position = start_position
			moving_down = false
			moving_up = true
			time_elapsed = 0.0
		else:
			var offset = exp(-5 * (1.0 - progress)) * press_amplitude * 10
			# stop at the bottom
			position.y = min(start_position.y + offset, end_position.y)
		
	if not moving_down and moving_up:
		time_elapsed += delta

		# Calculate progress as a normalized value between 0 and 1
		var progress = time_elapsed / press_duration

		if progress >= 1.0:
			# If the motion is complete, snap to the start position and stop
			position = start_position
			moving_down = false
			moving_up = true
			time_elapsed = 0.0
		else:
			var offset = exp(-5 * (1.0 - progress)) * press_amplitude * 10
			# stop at the bottom
			position.y = min(end_position.y - offset, start_position.y)

func _input(event):
	if event.is_action_pressed("ui_accept") and not moving_down and not moving_up:
		moving_down = true
		time_elapsed = 0.0
		
func _on_Area2D_area_entered(area):
	print("Object entered the press!")
