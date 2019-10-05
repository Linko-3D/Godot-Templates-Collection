extends KinematicBody

var gravity = 9.8

export var speed = 6.0
export var sprint_speed_multiplier = 1.5
export var jump_height = 6.5
export var mouse_sensitivity = 1

var vector = Vector3()
var snap_distance = -0.11
var snap = Vector3(0, snap_distance, 0)

var jumped = true

# ----------------------------------
# Movement inputs and gravity

func _physics_process(delta):
	vector.x = 0		# Resets the direction when no key is pressed
	vector.z = 0

	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if Input.is_action_pressed("ui_up"):
			vector += -global_transform.basis.z * speed
		if Input.is_action_pressed("ui_down"):
			vector += global_transform.basis.z * speed
		if Input.is_action_pressed("ui_left"):
			vector += -global_transform.basis.x * speed
		if Input.is_action_pressed("ui_right"):
			vector += global_transform.basis.x * speed

		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			vector.y = jump_height
			snap = Vector3()
		else:
			snap = Vector3(0, snap_distance, 0)
		
	extra_abilities()
	
	#vector = vector.rotated(Vector3.UP, rotation.y)
	vector.y -= gravity * delta					# Gravity

	vector =  move_and_slide_with_snap(vector, snap, Vector3.UP, true, 4, 5)

# ----------------------------------
# Mouse controls

func _input(event):
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotation_degrees.y -= event.relative.x * mouse_sensitivity / 10			# Look left and right (yaw axis)
		$Camera.rotation_degrees.x -= event.relative.y * mouse_sensitivity / 10	# Look up and down (pitch axis)
		$Camera.rotation_degrees.x = clamp($Camera.rotation_degrees.x, -90, 90)	# Clamps the up and down rotation

# ----------------------------------
# Extra abilities

func extra_abilities():
	# Sprint:
	if Input.is_action_pressed("sprint") and is_on_floor():
		if vector.z < 0:						# If moving forward
			vector.z *= sprint_speed_multiplier	# Run
	
	# Auto Jump:
	if is_on_floor() != true and jumped == false:
		vector.y = jump_height
		jumped = true
	if is_on_floor():
		jumped = false
	