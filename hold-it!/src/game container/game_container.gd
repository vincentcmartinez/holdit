class_name Gamecontainer extends Node2D

@onready var main_menu_scene = preload("res://src/menus/main_menu.tscn")
@onready var world_scene = preload("res://src/game container/world.tscn")
var minigaming = false

func _ready() -> void:
	spawn_main_menu()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	RenderingServer.set_default_clear_color(Color.BLACK)

func spawn_main_menu():
	var main_menu_inst = main_menu_scene.instantiate()
	add_child(main_menu_inst)

func spawn_world():
	var world_inst = world_scene.instantiate()
	add_child(world_inst)
