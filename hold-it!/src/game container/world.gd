extends Node2D
class_name World

@onready var toy_car = preload("res://src/toys/car/toy_car.tscn")
@onready var toy_robot = preload("res://src/toys/robot/toy_robot.tscn")
@onready var toy_monkey = preload("res://src/toys/monkey/toy_monkey.tscn")
@onready var toy_dino = preload("res://src/toys/dino/toy_dino.tscn")
@onready var toy_bunny = preload("res://src/toys/bunny/toy_bunny.tscn")

@onready var belt_speed = 5
@onready var spawn_rate = 1.5
@onready var toys = [toy_dino, toy_monkey, toy_car, toy_bunny]

@onready var game_start = false

var paused = false

func start_game():
	game_start = true
	$ToySpawner.start_game()

func _ready():
	start_game()

func _input(event):
	if event.is_action_pressed("ui_cancel") and not paused:
		get_tree().paused = true
		get_tree().get_root().get_node("GameContainer").spawn_pause_menu()
