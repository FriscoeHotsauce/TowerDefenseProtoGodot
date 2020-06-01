extends Node2D

const Utils = preload("Utils.gd")

export onready var parent = get_parent()
export onready var laser = parent.find_node("Line2D")
export var cooldown = 2
export var turret_range = 200
var current_target
var current_time



# Called when the node enters the scene tree for the first time.
func _ready():
	current_time = 0
	current_target = null

func _physics_process(delta):
	updateCooldown(delta)
	if(current_time <= 0):
		acquireTarget()
		if(current_target != null):
			shoot()

func updateCooldown(delta):
	current_time = current_time - delta


func acquireTarget():
	#if we already have a target, don't search for a new one
	if(current_target != null):
		return
	else:
		current_target = Utils.getClosestFromList(get_tree().get_nodes_in_group("enemy"), self.position, turret_range)

func shoot():
	laser.blast_target(to_local(self.position), to_local(current_target.position))
	print("Bang!")
	var killed = current_target.hitMe()
	if(killed):
		current_target = null
	current_time = cooldown
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
