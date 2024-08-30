# DoorResource.gd
extends Resource
class_name DoorResource

@export var door_name: String = "Default Door"
@export_file("*.tscn") var target_scene_path: String = ""

func get_door_name() -> String:
	return door_name

func get_target_scene_path() -> String:
	return target_scene_path

func is_valid() -> bool:
	return target_scene_path != ""
