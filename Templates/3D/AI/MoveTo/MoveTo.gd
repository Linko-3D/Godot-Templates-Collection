extends KinematicBody

export var speed = 1
export var lock_linear_y = true
export var lock_angular_x = true

var target
var vector = Vector3()
var keepHeight = Vector3()

func _ready():
	target = get_tree().get_nodes_in_group("Player")[0] # Get the target with the first node in the Player group
	keepHeight = translation.y
	
func _process(delta):
	vector = (target.translation - translation).normalized() # Get the direction by subtracting the current position by the target position
	
	if lock_linear_y:
		translation.y = keepHeight # Keep the same height
	
	move_and_slide(vector * speed)
	
	look_at(target.translation, Vector3.UP) # Look at the target

	if lock_angular_x:
		rotation.x = 0