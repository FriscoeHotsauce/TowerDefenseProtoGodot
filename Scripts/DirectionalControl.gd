extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
enum direction { LEFT, RIGHT, UP, DOWN }
export var left_animation = "walk_left"
export var right_animation = "walk_right"
export var up_animation = "walk_up"
export var down_animation = "walk_down"
var lastPosition
var facing
var last_facing
var sprite
# Called when the node enters the scene tree for the first time.
func _ready():
	lastPosition = get_global_position()
	facing = direction.DOWN
	last_facing = facing
	sprite = $AnimatedSprite


func _process(delta):
	var x_delta = lastPosition.x - get_global_position().x 
	var y_delta = lastPosition.y - get_global_position().y 
	
	if(abs(y_delta) > abs(x_delta)):
		if(y_delta > 0):
			facing = direction.UP
		else:
			facing = direction.DOWN
	else:
		if(x_delta > 0):
			facing = direction.LEFT
		else:
			facing = direction.RIGHT
		
	if(last_facing != facing):
		play_directional_animation()
		last_facing = facing
	
	lastPosition = get_global_position()


func play_directional_animation():
	if(facing == direction.UP):
		sprite.play(up_animation)
	if(facing == direction.DOWN):
		sprite.play(down_animation)
	if(facing == direction.LEFT):
		sprite.play(left_animation)
	if(facing == direction.RIGHT):
		sprite.play(right_animation)
		
