extends Control

func _ready():
	$AnimationPlayer.play("RESET")
	$Sprite2D.visible = false



func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur")

func pause():
	get_tree().paused = true
	$AnimationPlayer.play("blur")


func test_escape():
	if Input.is_action_just_pressed("pause") and get_tree().paused == false:
		pause()
		$Sprite2D.visible = true
	elif Input.is_action_just_pressed("pause") and get_tree().paused == true:
		resume()
		$Sprite2D.visible = false


func _on_messages_pressed():
	pass # Replace with function body.


func _on_settings_pressed():
	pass # Replace with function body.


func _on_gallery_camera_pressed():
	pass # Replace with function body.


func _on_quests_pressed():
	pass # Replace with function body.


func _on_save_pressed():
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func _process(delta):
	test_escape()
