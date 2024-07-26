extends Node2D

func _ready():
	pass # Replace with function body.

func _process(delta):
	pass


func _on_door_body_entered(body: CharacterBody2D):
	print("player inside me UwU")
	global.door_entered = true
	global.transition_scene = true
	global.current_door = "c_to_mainst"

func _on_door_body_exited(body: CharacterBody2D):
	print("OwO, I is now so alone")
	global.door_entered = false
	global.transition_scene = false
	global.current_door = "none"
