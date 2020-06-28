extends Node2D

const Utils = preload("Utils.gd")

export onready var laser = $Line2D
export onready var sprite = $AnimatedSprite
export var cooldown = 2
export var turret_range = 200
export var damage = 1
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

	#if we already have a target, don't search for a new one, unless the current target is out of range
	if(current_target != null && is_instance_valid(current_target)):
		var distance_delta = self.position.distance_to(current_target.position)
		if(distance_delta > turret_range):
			current_target = null
	
	#if the current target is null
	if(current_target == null || !is_instance_valid(current_target)):
		current_target = Utils.getClosestFromList(get_tree().get_nodes_in_group("enemy"), self.position, turret_range)

func shoot():
	laser.blast_target(to_local(self.position), to_local(current_target.position))
	sprite.play("shoot")
	var killed = current_target.hitMe(damage)
	if(killed):
		current_target = null
	current_time = cooldown
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimatedSprite_animation_finished():
	sprite.play("idle")
