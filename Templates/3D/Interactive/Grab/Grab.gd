extends RayCast

export var mass_limit = 50

var object_grabbed = null

func _process(delta):
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if Input.is_action_just_pressed("interact") and object_grabbed != null:
			get_collider().set_mode(0)		# We set the object to RigidBody again to reset the gravity
			get_collider().can_sleep = false
			object_grabbed = null
			enabled = true

	if is_colliding():
		if get_collider().get_class() == "RigidBody" and get_collider().mass <= mass_limit:
			if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
				if Input.is_action_just_pressed("interact"):
					object_grabbed = get_collider()
					enabled = false

	if object_grabbed != null:
		get_collider().global_transform = $Hold.global_transform

func _input(event): 
	if event is InputEventMouseButton and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event.button_index == 1 and event.pressed == true:
			if object_grabbed != null:
				get_collider().set_mode(0)	# We set the object to RigidBody again to reset the gravity
				object_grabbed = null
				enabled = true

#projectile_instance.linear_velocity = global_transform.basis.z * -force