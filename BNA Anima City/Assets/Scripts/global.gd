extends Node

var current_scene = "main_st" 
var current_door = "none"
var door_entered = false
var transition_scene = false

var player_first_start = true
var player_start_game_posx = 0
var player_start_game_posy = 0

#this next section will be me logging all of the x,y positions to place the player after transitioning scenes related to main st
var player_exit_cafe_posx = 0
var player_exit_cafe_posy = 0

var player_enter_cafe_posx = 0
var player_enter_cafe_posy = 0

var player_enter_mainst_left_posx = 0
var player_enter_mainst_left_posy = 0

var player_enter_mainst_right_posx = 0
var player_enter_mainst_right_posy = 0



func finish_change_scene():
	if transition_scene == true:
		transition_scene = false
