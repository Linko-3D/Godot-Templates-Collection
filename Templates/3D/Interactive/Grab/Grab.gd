extends RayCast

export var mass_limit = 50
export var push_force = 10

var object_grabbed = null

func _process(delta):
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if Input.is_action_just_pressed("interact") and object_grabbed != null: # If we grab something and press interact
			get_collider().can_sleep = false # We disable can sleep on the Rigid Body to make sure it falls down
			get_collider().set_mode(0)		# We set the object to RigidBody again to reset the gravity
			object_grabbed = null
			enabled = true

	if is_colliding():
		if get_collider().get_class() == "RigidBody" and get_collider().mass <= mass_limit:
			if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
				if Input.is_action_just_pressed("interact"):
					object_grabbed = get_collider()
					enabled = false # We disable the raycast now that we have stored the first object pointed with the click above

	if object_grabbed != null:
		get_collider().global_transform = $Hold.global_transform # If we have grabbed a rigid body, set it to the hold node position

func _input(event): 
	if event is InputEventMouseButton and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event.button_index == 1 and event.pressed == true:
			if object_grabbed != null:
				get_collider().can_sleep = false
				get_collider().set_mode(0)	# We set the object to RigidBody again to reset the gravity
				object_grabbed = null
				enabled = true
				get_collider().linear_velocity = global_transform.basis.z * -push_force