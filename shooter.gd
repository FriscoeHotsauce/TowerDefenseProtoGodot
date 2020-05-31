extends Node2D

onready var parent = get_parent()
export var cooldown = 3
export var turret_range = 0.75
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

	var enemies = get_tree().get_nodes_in_group("enemy")
	for enemy in enemies:
		var delta_range = self.position.distance_to(enemy.position)

		if(delta_range <= turret_range):
			print("Target in range: " + str(delta_range))
			print("Target Acquired! - " + enemy.name)
			current_target = enemy
			break

func shoot():
	print("Bang!")
	var killed = current_target.hitMe()
	if(killed):
		current_target = null
	current_time = cooldown
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
