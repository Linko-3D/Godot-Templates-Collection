extends RayCast

export var pull_force = 25.0

var player
var destination
var vector
var hold = false

func _ready():
	player = get_tree().get_nodes_in_group("Player")[0] # Get the first node in the group "Player"

func _process(delta):
	if hold:
		vector = (destination - player.translation).normalized()
		player.move_and_slide(vector * pull_force)

func _input(event):	
	if event is InputEventMouseButton:
		if event.button_index == 2 and event.pressed == true:
			if is_colliding() and get_collider().get_class() != "RigidBody":
				destination = get_collision_point()
				hold = true
		if event.button_index == 2 and event.pressed == false:
			hold = false
