extends RayCast

func _process(delta):
	if is_colliding():
		if get_collider().get_class() == "RigidBody":
			pass
