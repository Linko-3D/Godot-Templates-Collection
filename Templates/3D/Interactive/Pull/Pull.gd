extends RayCast

var vector

func _process(delta):
	if is_colliding():
		if get_collider().get_class() == "RigidBody":
			vector = (get_collider().translation - translation).normalized()
			get_collider().translation -= vector
			#print(translation)