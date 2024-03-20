extends CharacterBody2D

# <- this hashtag is to start a comment

@export var gravity = 1 # this is the power of gravity in our game
@export var jump_power = 1 # this is power of jumping for my character
@export var camera: Camera2D

@onready var sprite = $AnimatedSprite2D
@onready var jump_sound = $JumpSound

var active = true # vocabulary word: boolean - true or false
var jump_remaining = 2 # right now 2 means double jump, if you want triple jump make it a 3
var was_jumping = false
var jump_pitch = 1.0

func _ready():
	print("hello nathans")

func _physics_process(delta):
	velocity.y += gravity * delta
	
	if active:
		# Update the camera position when player position changes
		camera.position = position
		
		# Reset the player after landing on platform
		if was_jumping and is_on_floor():
			was_jumping = false
			jump_remaining = 2
			sprite.play("run")
			jump_pitch = 1.0
		
		# Handle jumping
		if Input.is_action_just_pressed("jump") and jump_remaining > 0:
			jump_remaining -= 1 # j = j - 1
			was_jumping = true
			velocity.y = -jump_power
	
			if jump_remaining == 1:
				sprite.play("jump")
			else:
				sprite.play("double jump")
				
			jump_sound.set_pitch_scale(jump_pitch)
			jump_sound.play()
			jump_pitch += 0.2
	
	
	move_and_slide()
