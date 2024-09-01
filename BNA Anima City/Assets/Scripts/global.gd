extends Node

var dialogue: bool = false

var current_scene = "main_st" 
var current_door = "none"
var door_entered = false
var transition_scene = false

var player_first_start = true
var player_start_game_posx = 0
var player_start_game_posy = 0

#this next section will be me logging all of the x,y positions to place the player after transitioning scenes related to main st
var main_st : Vector2 = Vector2(0, 0)
var cafe : Vector2 = Vector2(0, 0)


# This section is where I'll track NPC levels
var shirou_level = 0
var nazuna_level = 0
