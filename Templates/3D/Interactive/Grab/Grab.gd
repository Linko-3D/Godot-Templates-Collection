extends RayCast

var hold = false
func _process(delta):
	if is_colliding():
		if "can_grab" in get_collider():
			if Input.is_action_just_pressed("interact"):
				hold = true
		if hold:
			get_collider().global_transform = $Hold.global_transform
			