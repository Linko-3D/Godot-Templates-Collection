extends Spatial

var target
var angle_limit = 45

func _process(delta):
	print(rotation_degrees.y)
	target = get_tree().get_nodes_in_group("Player")[0] # Get the target with the first node in the Player group

	if $RayCast.get_collider() == target and rotation_degrees.y <= angle_limit and rotation_degrees.y >= -angle_limit:
			look_at(target.translation, Vector3.UP) # Look at the target

	if rotation_degrees.y > angle_limit:
		rotation_degrees.y = angle_limit
	if rotation_degrees.y < -angle_limit:
		rotation_degrees.y = -angle_limit