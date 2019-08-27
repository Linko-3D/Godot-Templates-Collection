extends KinematicBody

const GRAVITY = 9.8

var velocity = Vector3()
var speed = 6
var jump_height = 6.5

var snap_distance = -0.1
var snap = Vector3(0, snap_distance, 0)

var mouse_sensitivity = 0.15

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

# ----------------------------------
# Keyboard controls and gravity

func _physics_process(delta):
	velocity.x = 0 # Resets the direction when no key is pressed
	velocity.z = 0

	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if Input.is_action_pressed("ui_up"):
			velocity += -global_transform.basis.z * speed
		if Input.is_action_pressed("ui_down"):
			velocity += global_transform.basis.z * speed
		if Input.is_action_pressed("ui_left"):
			velocity += -global_transform.basis.x * speed
		if Input.is_action_pressed("ui_right"):
			velocity += global_transform.basis.x * speed
		
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			snap = Vector3()
			velocity.y = jump_height
		else:
			snap = Vector3(0, snap_distance, 0)
		
		velocity.y -= GRAVITY * delta # Gravity
		
	velocity =  move_and_slide_with_snap(velocity, snap, Vector3.UP, true, 4, 5)

# ----------------------------------
# Mouse controls

func _input(event):
	if event is InputEventMouseButton and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event.button_index == 4:
			$Yaw/Pitch/Head.translation += -global_transform.basis.z / 10 # Zoom
		if event.button_index == 5:
			$Yaw/Pitch/Head.translation += global_transform.basis.z / 10 # Zoom

	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotation.y += deg2rad(-event.relative.x * mouse_sensitivity) # Yaw axis
		$Yaw/Pitch.rotation.x += deg2rad(-event.relative.y * mouse_sensitivity) # Pitch axis
		$Yaw/Pitch.rotation.x = clamp($Yaw/Pitch.rotation.x, deg2rad(-80), deg2rad(10)) # Clamps the up and down rotation