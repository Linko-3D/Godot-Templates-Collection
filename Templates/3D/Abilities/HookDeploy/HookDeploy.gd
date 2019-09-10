extends RayCast

export var pull_force = 25.0

var character
var destination
var vector
var hold = false

var distance = 0
var speed = 30
var locked = false
var pull = false

func _ready():
	character = get_tree().get_nodes_in_group("Player")[0] # Get the first node in the group "Player"

func _process(delta):
	cast_to.z = -distance

	if hold:
		distance += speed * delta
	else:
		distance = 0
		locked = false
		pull = false

	if is_colliding() and hold and locked == false:
		destination = get_collision_point()
		locked = true
		pull = true
	if pull:
		vector = (destination - character.translation).normalized()
		character.move_and_slide(vector * pull_force)

func _input(event):
	if event is InputEventMouseButton and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event.button_index == 2 and event.pressed == true:
			hold = true
			#if is_colliding():
			#	destination = get_collision_point()
		if event.button_index == 2 and event.pressed == false:
			hold = false