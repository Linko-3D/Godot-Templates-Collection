extends RayCast

var angle_limit = 35

func _process(delta):
	if get_collider() != null:
		$ArmPosition.look_at(get_collision_point(), Vector3.UP)
	else:
		$ArmPosition.rotation = Vector3()
	
	if ($ArmPosition.rotation_degrees.x - rotation_degrees.x) > angle_limit:
		print("too high")