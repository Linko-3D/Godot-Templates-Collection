extends Spatial

var target

var jumped = true

func _ready():
	target = get_tree().get_nodes_in_group("Player")[0] # Get the first node in the group "Player" (recommended)

func _process(delta):
	if target.is_on_floor() != true and jumped == false:
		target.vector.y = target.jump_height
		jumped = true
	if target.is_on_floor():
		jumped = false