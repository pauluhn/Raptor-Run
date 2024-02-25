extends CharacterBody2D

@export var gravity = 1

func _ready():
	print("hello nathans")

func _physics_process(delta):
	velocity.x += gravity * delta
	move_and_slide()
