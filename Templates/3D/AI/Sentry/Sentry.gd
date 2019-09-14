extends Spatial

var target
var angle
var speed = 0.1

func _process(delta):
	rotation.x = 0
	rotation.z = 0
	rotate_y(speed)
	target = get_tree().get_nodes_in_group("Player")[0] # Get the target with the first node in the Player group

	if $RayCast.get_collider() == target:
		look_at(target.translation, Vector3.UP) # Look at the target
		$ShootTiming.enabled = true
	else:
		$ShootTiming.enabled = false