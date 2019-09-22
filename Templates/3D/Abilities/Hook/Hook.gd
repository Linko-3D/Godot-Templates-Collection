extends RayCast

export var pull_force = 25.0

var character
var destination
var vector
var hold = false

func _ready():
	character = get_tree().get_nodes_in_group("Player")[0] # Get the first node in the group "Player"

func _process(delta):
	if hold:
		vector = (destination - character.translation).normalized()
		character.move_and_slide(vector * pull_force)

func _input(event):
	if event is InputEventMouseButton and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event.button_index == 2 and event.pressed == true:
			if is_colliding() and get_collider().get_class() != "RigidBody":
				destination = get_collision_point()
				hold = true
		if event.button_index == 2 and event.pressed == false:
			hold = false