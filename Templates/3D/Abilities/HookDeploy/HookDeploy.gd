extends RayCast

export var pull_force = 25.0
export var deploy_speed = 100.0
export var max_range = 30.0

var character
var destination
var vector
var hold = false

var current_range = 0
var locked = false
var pull = false

func _ready():
	character = get_tree().get_nodes_in_group("Player")[0] # Get the first node in the group "Player"

func _process(delta):
	if current_range >= max_range: # If no contact is detected at max range the mouse click is released automatically
		hold = false
		
	cast_to.z = -current_range
	$HookVisual.scale.y = current_range

	if hold:
		if locked == false:
			current_range += deploy_speed * delta
		
		if is_colliding() and locked == false:
			destination = get_collision_point()
			locked = true # Allows to not update the colision point while holding the right click and moving the camera
			pull = true
	else:
		if current_range > 0:
			current_range -= deploy_speed * delta # pulls the hook if we release the click
		locked = false
		pull = false

	if pull:
		vector = (destination - character.translation).normalized() # Gets the vector between the player and the hook point
		character.move_and_slide(vector * pull_force) # Pulls the character to the point and apply the pull force

func _input(event):
	if event is InputEventMouseButton and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event.button_index == 2 and event.pressed == true:
			hold = true
		if event.button_index == 2 and event.pressed == false:
			hold = false