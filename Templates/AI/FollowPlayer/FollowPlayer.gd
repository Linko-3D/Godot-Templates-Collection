extends KinematicBody

export var speed = 1.0
export var lock_linear_y = true
export var lock_angular_x = true
export var lock_angular_y = false

var target
var vector = Vector3()
var keepHeight = Vector3()

func _ready():
	target = get_tree().get_nodes_in_group("Player")[0]
	keepHeight = global_transform.origin.y

func _process(delta):
	vector = (target.global_transform.origin - global_transform.origin).normalized() # Get the direction by subtracting the current position by the target position

	if lock_linear_y:
		global_transform.origin.y = keepHeight # Keep the same height

	move_and_slide(vector * speed)

	look_at(target.global_transform.origin, Vector3.UP) # Look at the target

	if lock_angular_x:
		rotation.x = 0
	if lock_angular_y:
		rotation.y = 0
