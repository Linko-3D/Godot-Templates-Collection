extends RayCast

export var mass_limit = 30
export var push_force = 5

var object_grabbed = null

func _process(delta):
	if Input.is_action_just_pressed("interact") and object_grabbed != null: # If we grab something and press interact
		get_collider().can_sleep = false 	# We disable can sleep on the Rigid Body to make sure it falls down
		get_collider().set_mode(0)			# We set the object to RigidBody again to reset the gravity
		object_grabbed = null
		enabled = true

	if is_colliding():
		if Input.is_action_just_pressed("interact"):
			if get_collider().get_class() == "RigidBody" and get_collider().mass <= mass_limit: # If the raycast is colliding with a RigidBody under the mass limit
				object_grabbed = get_collider() 	# We store the rigid body under the mass limit pointed with the interact key
				enabled = false 					# We disable the raycast now that we have stored the first object pointed

	if object_grabbed != null:
		get_collider().global_transform = $Hold.global_transform # If we have grabbed a rigid body, set it to the hold node position

func _input(event): 
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.pressed == true:	# If we left click
			if object_grabbed != null:							# If we hold something
				get_collider().can_sleep = false
				get_collider().set_mode(0)			# We set the object to RigidBody again to reset the gravity
				get_collider().linear_velocity = global_transform.basis.z * -push_force # We throw the object
				object_grabbed = null
				enabled = true
