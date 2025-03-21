extends Node2D
class_name GameContainer

@onready var main_menu_scene = preload("res://src/menus/main_menu.tscn")
@onready var world_scene = preload("res://src/game container/world.tscn")

func _ready() -> void:
	spawn_main_menu()

func spawn_main_menu():
	var main_menu_inst = main_menu_scene.instantiate()
	add_child(main_menu_inst)

func spawn_world():
	var world_inst = world_scene.instantiate()
	add_child(world_inst)
