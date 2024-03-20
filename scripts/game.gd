extends Node2D

@export var world_speed = 1
@export var moving_environment: Node2D

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	

func _physics_process(delta):
	# Move the platforms inside the Moving Environment
	moving_environment.position.x -= world_speed * delta
