extends RayCast

var grabbed = null

func _process(delta):
	print(grabbed)
	if is_colliding():
		if get_collider().get_class() == "RigidBody":
			if Input.is_action_just_pressed("interact"):
				grabbed = get_collider()
				enabled = false
				
	if grabbed != null:
		get_collider().global_transform = $Hold.global_transform