extends Spatial

var target
var angle_limit_y = 45

func _process(delta):
	target = get_tree().get_nodes_in_group("Player")[0] # Get the target with the first node in the Player group

	if $RayCast.get_collider() == target and rotation_degrees.y <= angle_limit_y and rotation_degrees.y >= -angle_limit_y:
			look_at(target.translation, Vector3.UP) # Look at the target

	if rotation_degrees.y > angle_limit_y:
		rotation_degrees.y = angle_limit_y
	if rotation_degrees.y < -angle_limit_y:
		rotation_degrees.y = -angle_limit_y