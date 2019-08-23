extends RayCast

var target
var auto_jump = true

func _ready():
	target = get_tree().get_nodes_in_group("Player")[0] # Get the target with the first node in the Player group

func _process(delta):
	if target.is_on_floor():
		auto_jump = true
	if not is_colliding() and auto_jump and target.is_on_floor():
		target.velocity.y = 6.5
		auto_jump = false