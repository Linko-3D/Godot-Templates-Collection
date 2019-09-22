extends RayCast

export var mass_limit = 30

var object_grabbed = null

func _process(delta):
	if Input.is_action_just_pressed("interact") and object_grabbed != null:
		get_collider().set_mode(0)
		object_grabbed = null
		enabled = true

	if is_colliding():
		if get_collider().get_class() == "RigidBody" and get_collider().mass <= mass_limit:
			if Input.is_action_just_pressed("interact"):
				object_grabbed = get_collider()
				enabled = false

	if object_grabbed != null:
		get_collider().set_mode(1)
		get_collider().global_transform = $Hold.global_transform