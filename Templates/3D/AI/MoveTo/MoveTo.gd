extends KinematicBody

var target = "FirstPersonCharacter"
var targetPosition
var vector = Vector3()
var speed = 1
var keepHeight = Vector3()

func _ready():
	keepHeight = translation.y # Get the starting height

func _process(delta):
	targetPosition = get_tree().get_root().find_node(target, true, false) # Get the target
	vector = ((translation - targetPosition.translation)*-1).normalized() # Get the direction
	translation.y = keepHeight # Keep the same height
	move_and_slide(vector * speed)