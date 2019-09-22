extends RayCast

var object_grabbed = null

func _process(delta):
	if Input.is_action_just_pressed("interact"):
		object_grabbed = null
		enabled = true

	if is_colliding():
		if get_collider().get_class() == "RigidBody":
			if Input.is_action_just_pressed("interact"):
				object_grabbed = get_collider()
				enabled = false

	if object_grabbed != null:
		get_collider().global_transform = $Hold.global_transform