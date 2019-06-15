extends KinematicBody

var target
var vector = Vector3()

func _ready():
	target = get_tree().get_root().find_node("FirstPersonCharacter", true, false) # Get the target node by his name

func _process(delta):
	vector = ((translation - target.translation)*-1).normalized() # Get the direction by subtracting the current position by the target position
	
	move_and_slide(vector)