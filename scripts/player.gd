extends CharacterBody2D

# <- this hashtag is to start a comment

@export var gravity = 1 # this is the power of gravity in our game
@export var jump_power = 1 # this is power of jumping for my character

var active = true # vocabulary word: boolean - true or false
var jump_remaining = 2 # right now 2 means double jump, if you want triple jump make it a 3
var was_jumping = false

func _ready():
	print("hello nathans")

func _physics_process(delta):
	velocity.y += gravity * delta
	
	if active:
		# Handle jumping
		if Input.is_action_just_pressed("jump") and jump_remaining > 0:
			jump_remaining -= 1 # j = j - 1
			was_jumping = true
			velocity.y = -jump_power
	
	move_and_slide()
