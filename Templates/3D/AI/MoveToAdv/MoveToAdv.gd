extends KinematicBody
# This version keeps the same height and moves only inside an height margin

var target
var vector = Vector3()
var speed = 1

var keepHeight = Vector3()
var heightDifference
var moveHeightMargin = 2

func _ready():
	keepHeight = translation.y # Get the starting height

func _process(delta):
	target = get_tree().get_root().find_node("FirstPersonCharacter", true, false) # Get the target node by his name
	vector = ((translation - target.translation)*-1).normalized() # Get the direction by subtracting the current position by the target position
	
	heightDifference = target.translation - translation
	
	if heightDifference.y > -moveHeightMargin and heightDifference.y < moveHeightMargin:
		move_and_slide(vector * speed)
	
	translation.y = keepHeight # Keep the same height