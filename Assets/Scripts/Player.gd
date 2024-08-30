extends CharacterBody2D

var SPEED = 750.0
const JUMP_VELOCITY = -500.0

@onready var animated_sprite = $AnimatedSprite2D
#@onready var label = $CanvasLayer/Panel/Label             #it's spamming errors

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
		SPEED = 750


	move_and_slide()
