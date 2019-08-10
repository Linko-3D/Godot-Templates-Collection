extends Spatial

var target

func _process(delta):
	target = get_tree().get_nodes_in_group("Player")[0] # Get the target with the first node in the Player group

	if $RayCast.get_collider() == target:
		look_at(target.translation, Vector3.UP) # Look at the target