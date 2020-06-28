extends PathFollow2D

export var speed = 150
export var HP = 3
export var damageToBase = 1
onready var gameManager
onready var healthBar = $HealthBar

func _ready():
	healthBar.max_value = HP
	updateHealthbar()
	gameManager = get_node("/root/root/GameManager")
	pass # Replace with function body.

func _process(delta):
	if(get_unit_offset() >= .999):
		dealBaseDamage()
	else:
		set_offset(get_offset() + speed * delta)

func hitMe(damage):
	HP = HP - damage
	if(HP <= 0):
		self.queue_free()
		return true
	else:
		updateHealthbar()
		return false

func dealBaseDamage():
	gameManager.removeLives(damageToBase)
	self.queue_free()
	#print('do damage')
	
#todo
func updateHealthbar():
	healthBar.value = HP
	#self.scale.x = (HP / 3.0)
	#self.scale.y = (HP / 3.0)
