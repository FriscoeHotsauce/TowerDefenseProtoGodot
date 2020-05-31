extends Node


onready var parent = get_parent()
onready var path = parent.get_node("PathOne")
export var spawn_interval = 5
export (PackedScene) var drone
var current_time


# Called when the node enters the scene tree for the first time.
func _ready():
	current_time = spawn_interval
	pass # Replace with function body.

func _process(delta):
	update_cooldown(delta)
	

func update_cooldown(delta): 
	current_time = current_time - delta
	if (current_time <= 0):
		spawn_dude()
	

func spawn_dude():
	print("breh")
	var node = drone.instance()
	path.add_child(node)
	current_time = spawn_interval

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
