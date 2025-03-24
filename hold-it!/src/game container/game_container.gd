class_name Gamecontainer extends Node2D

@onready var main_menu_scene = preload("res://src/menus/main_menu.tscn")
@onready var world_scene = preload("res://src/game container/world.tscn")
@onready var pause_scene = preload("res://src/menus/pause_menu.tscn")
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var minigaming = false

func _ready() -> void:
	spawn_main_menu()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	RenderingServer.set_default_clear_color(Color.BLACK)
	SignalBus.connect("life_lost", play_hurt)

func spawn_main_menu():
	var main_menu_inst = main_menu_scene.instantiate()
	add_child(main_menu_inst)

func spawn_world():
	var world_inst = world_scene.instantiate()
	add_child(world_inst)

func spawn_pause_menu():
	var pause_menu_inst = pause_scene.instantiate()
	add_child(pause_menu_inst)

func game_over(score):
	$AudioStreamPlayer.play()
	#$GameOver.visible = true
	animated_sprite_2d.play("fired")
	$ScoreLabel.text = "Final Score: " + str(floor(score))
	$ScoreLabel.visible = true
	await get_tree().create_timer(3).timeout
	get_tree().change_scene_to_file("res://src/game container/game_container.tscn")

func play_hurt():
	$hurt.play()
