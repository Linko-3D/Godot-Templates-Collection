extends KinematicBody

var target
var vector = Vector3()
var keepHeight = Vector3()

func _ready():
	target = get_tree().get_root().find_node("FirstPersonCharacter", true, false) # Get the target node by his name
	keepHeight = translation.y
	
func _process(delta):
	vector = ((translation - target.translation)).normalized() # Get the direction by subtracting the current position by the target position
	
	translation.y = keepHeight # Keep the same height
	
	move_and_slide(-vector)