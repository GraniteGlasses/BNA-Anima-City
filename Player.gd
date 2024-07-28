extends CharacterBody2D

var SPEED = 600.0
var cheetah_speed = false
const JUMP_VELOCITY = -500.0

@onready var animated_sprite = $AnimatedSprite2D
@onready var label = $CanvasLayer/Panel/Label

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func player():
	pass

func _physics_process(delta):
	if not is_on_floor():
		if Input.is_action_pressed("jump"):
			velocity.y += gravity * delta
		else:
			velocity.y += 2 * gravity * delta
	
	

	if Input.is_action_just_pressed("jump") and is_on_floor():
		animated_sprite.play("jump_start")
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis("move_left", "move_right")
	
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction <0:
		animated_sprite.flip_h = true
	
	
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
			if direction == 0 and Input.is_action_just_pressed("jump"):
				animated_sprite.play("jump_start")
			else:
				animated_sprite.play("idle")
		else:
			if velocity.y == 0:
				if SPEED == 300:
					animated_sprite.play("walking")
				else:
					animated_sprite.play("run")
	
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 35)
	
	if Input.is_action_pressed("walk"):
		SPEED = 300
	if Input.is_action_just_released("walk"):
		SPEED = 600
	
	if Input.is_action_just_pressed("beast_power"):
		if cheetah_speed == false:
			SPEED = 1200
			cheetah_speed = true
			print(cheetah_speed)
		else:
			cheetah_speed = false
			SPEED = 600
			print(cheetah_speed)

	
	if Input.is_action_just_pressed("interact") and global.transition_scene == true:
		if global.door_entered == true:
			if global.current_door == "cafe":
				get_tree().change_scene_to_file("res://Scenes/cafe.tscn")
				global.current_scene = "Cafe"
				global.finish_change_scene()
				global.door_entered = false
			elif global.current_door == "c_to_mainst":
				get_tree().change_scene_to_file("res://Scenes/main_st.tscn")
				global.finish_change_scene()
				global.current_scene = "Main St."
				global.door_entered = false
			elif global.current_door == "none":
				print("that's really weird...")
				global.finish_change_scene()
				return
		else:
			print("Idk you're not in a door bro")
			return
	
	move_and_slide()

