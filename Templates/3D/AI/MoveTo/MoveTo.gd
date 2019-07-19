extends KinematicBody

var target
var vector = Vector3()
var keepHeight = Vector3()

func _ready():
	target = get_tree().get_nodes_in_group("Player")[0] # Get the target with the first node in the Player group
	keepHeight = translation.y
	
func _process(delta):
	vector = ((translation - target.translation)).normalized() # Get the direction by subtracting the current position by the target position
	
	translation.y = keepHeight # Keep the same height
	
	move_and_slide(-vector)