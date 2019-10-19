extends RayCast

func _process(delta):
	if get_collider() != null:
		if get_collider().is_in_group("Enemy"):
			print("Enemy!")