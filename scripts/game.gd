extends Node2D

@export var world_speed = 1
@export var moving_environment: Node2D

var platform = preload("res://scenes/platform.tscn")
var rng = RandomNumberGenerator.new()
var last_platform_position = Vector2.ZERO
var next_spawn_time = 0

func _ready():
	rng.randomize()
	
func _process(delta):
	# Check to see if we need to spawn a platform
	if Time.get_ticks_msec() > next_spawn_time:
		_spawn_next_platform() # call our new method that we created to refactor our code to be cleaner

func _spawn_next_platform():
	var new_platform = platform.instantiate()
		
	# Set the position of the new platform
	if last_platform_position == Vector2.ZERO:
		new_platform.position = Vector2(400, 0)
	else:
		var x = last_platform_position.x + rng.randi_range(450, 550)
		var y = last_platform_position.y + rng.randi_range(-150, 150)
		new_platform.position = Vector2(x, y)
		
	moving_environment.add_child(new_platform)
	last_platform_position = new_platform.position
	next_spawn_time += world_speed

func _physics_process(delta):
	# Move the platforms inside the Moving Environment
	moving_environment.position.x -= world_speed * delta
