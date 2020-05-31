extends PathFollow2D

export var speed = 50
export var HP = 3

func _ready():
	pass # Replace with function body.

func _process(delta):
	set_offset(get_offset() + speed * delta)

func hitMe():
	HP = HP - 1
	if(HP == 0):
		self.queue_free()
		return true
	else:
		return false
