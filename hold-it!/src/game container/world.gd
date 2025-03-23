extends Node2D
class_name World

@onready var toy_car = preload("res://src/toys/car/toy_car.tscn")
@onready var toy_robot = preload("res://src/toys/robot/toy_robot.tscn")
@onready var toy_monkey = preload("res://src/toys/monkey/toy_monkey.tscn")
@onready var toy_dino = preload("res://src/toys/dino/toy_dino.tscn")
@onready var toy_bunny = preload("res://src/toys/bunny/toy_bunny.tscn")

@onready var current_level = 0
@onready var levels = ["level_0", "level_1", "level_2"]
@onready var level_stats = {
	"level_0" = {
		"toys" = [toy_monkey, toy_bunny, toy_dino, toy_car],
		"spawn_rate" = 1.5,
		"belt_speed" = 5
	},
	"level_1" = {
		"toys" = [toy_dino, toy_car],
		"spawn_rate" = 1.5,
		"belt_speed" = 5
	},
	"level_2" = {
		"toys" = [toy_monkey, toy_bunny, toy_dino, toy_car],
		"spawn_rate" = 1.5,
		"belt_speed" = 5
	}
}

@onready var belt_speed = level_stats.get(levels[current_level]).get("belt_speed")
@onready var spawn_rate = level_stats.get(levels[current_level]).get("spawn_rate")
@onready var toys = level_stats.get(levels[current_level]).get("toys")

@onready var game_start = false
@onready var score = 0

var paused = false

func start_game():
	game_start = true
	$ToySpawner.start_game()

func game_over():
	get_parent().game_over(score)
	queue_free()

func _physics_process(delta: float) -> void:
	score += 0.1
	$CanvasLayer/ScoreLabel.text = "Score: " + str(floor(score))

func _ready():
	start_game()

func _input(event):
	if event.is_action_pressed("ui_cancel") and not paused:
		get_tree().paused = true
		get_tree().get_root().get_node("GameContainer").spawn_pause_menu()
