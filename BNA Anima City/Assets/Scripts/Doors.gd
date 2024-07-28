extends Node

@export var door_data : DoorResource
@export var back_door_data : DoorResource

var player_inside : bool = false 

func _ready():
	if door_data and door_data.is_valid() == false:
		print("A door is not valid")

# FOR SOME REASON, IF CONNECTED WITH INTERFACE, SPAMS ERRORS. (took 1h to fix it even tho it is not breaking anything)
	if not is_connected("body_entered", Callable(self, "_on_body_entered")):
		connect("body_entered", Callable(self, "_on_body_entered"))
	
	if not is_connected("body_exited", Callable(self, "_on_body_entered")):
		connect("body_exited", Callable(self, "_on_body_entered"))
		
func use_door():
	if door_data and door_data.is_valid():
		pack_and_change_scene(door_data.get_target_scene_path())

func _on_body_entered(body):
	if body.get_class() == "CharacterBody2D":
		player_inside = true

func _on_body_exited(body):
	if body.get_class() == "CharacterBody2D":
		player_inside = false

func _physics_process(delta):
	if Input.is_action_just_pressed("interact") and player_inside:
		use_door()
		print("door used")



func pack_and_change_scene(new_scene_path: String):
	# Get the current scene
	var current_scene = get_tree().current_scene
	
	# Pack the current scene
	var packed_scene = PackedScene.new()
	packed_scene.pack(current_scene)
	
	# Save the packed scene (optional)
	var save_path = "user://" + back_door_data.door_name + ".tscn"
	var error = ResourceSaver.save(packed_scene, save_path)
	if error != OK:
		print("Failed to save packed scene")
	
	# Change to the new scene. if the scene already exists packed, change to it, if not, change to a file
	var next_scene = load("user://" + door_data.door_name + ".tscn")
	print("getting to the next scene")
	if next_scene is PackedScene:
		@warning_ignore("redundant_static_unload")
		get_tree().change_scene_to_packed(next_scene)
		print("went to packed scene ", "user://" + door_data.door_name + ".tscn")
	else:
		get_tree().change_scene_to_file(door_data.target_scene_path)
		print("went to scene file")
