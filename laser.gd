extends Line2D

export var visibility_time = .2
var is_visible: bool
var current_time

func _ready():
	current_time = 0
	is_visible = false

func _process(delta):
	current_time = current_time - delta
	if(is_visible && current_time < 0):
		clear_points()
	

func blast_target(turret_position, target_position):
	add_point(turret_position)
	add_point(target_position)
	is_visible = true
	current_time = visibility_time

func clear_points():
	remove_point(0)
	remove_point(1)
