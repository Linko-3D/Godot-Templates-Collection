extends RayCast

export var pull_speed = 1.0

var vector

func _process(delta):
	if is_colliding():
		if get_collider().get_class() == "RigidBody":
			vector = (get_collider().translation - global_transform.origin).normalized()
			get_collider().translation -= vector * pull_speed * 0.1