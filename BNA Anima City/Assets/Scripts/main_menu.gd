extends Node


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_st.tscn")


func _on_settings_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/menu_settings.tscn")


func _on_quit_button_pressed():
	get_tree().quit()
