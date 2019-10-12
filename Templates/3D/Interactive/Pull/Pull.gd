extends RayCast

var vector

func _process(delta):
	print(global_transform.origin)
	if is_colliding():
		if get_collider().get_class() == "RigidBody":
			vector = (get_collider().translation - global_transform.origin).normalized()
			get_collider().translation -= vector * 0.1