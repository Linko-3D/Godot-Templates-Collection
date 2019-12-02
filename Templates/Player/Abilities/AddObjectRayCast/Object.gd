extends StaticBody

func _process(delta):
	if Input.is_action_just_pressed("reset"):
		queue_free()