extends RayCast

func _process(delta):
	if get_collider() != null:
		$ArmPosition.look_at(get_collision_point(), Vector3.UP)
	else:
		$ArmPosition.rotation = Vector3()