extends RayCast

func _process(delta):
	$Crosshair.position.x = OS.window_size.x / 2
	$Crosshair.position.y = OS.window_size.y / 2
	
	if Input.is_action_just_pressed("shoot"):
		if get_collider() != null:
			if get_collider().is_in_group("enemy"):
				get_collider().queue_free()
