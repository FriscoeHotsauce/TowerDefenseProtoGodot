extends Control

export var starting_lives = 5
var lives
onready var livesText = $LivesText

# Called when the node enters the scene tree for the first time.
func _ready():
	lives = starting_lives
	updateLivesText()
	pass # Replace with function body.

func removeLives(livesToRemove):
	lives = max((lives - livesToRemove), 0)
	updateLivesText()

func updateLivesText():
	if(lives > 0):
		livesText.set_text("Lives Remaining: "+str(lives))
	else:
		livesText.set_text("Game over man, game over!")
