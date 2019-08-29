extends KinematicBody

const GRAVITY = 9.8

export var speed = 6.0
export var jump_height = 6.5
export var mouse_sensitivity = 1

var velocity = Vector3()
var snap_distance = -0.11
var snap = Vector3(0, snap_distance, 0)

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

# ----------------------------------
# Keyboard controls and gravity

func _physics_process(delta):
	velocity.x = 0 # Resets the direction when no key is pressed
	velocity.z = 0

	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if Input.is_action_pressed("ui_up"):
			velocity.z = -speed
		if Input.is_action_pressed("ui_down"):
			velocity.z = speed
		if Input.is_action_pressed("ui_left"):
			velocity.x = -speed
		if Input.is_action_pressed("ui_right"):
			velocity.x = speed
		
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = jump_height
			snap = Vector3()
		else:
			snap = Vector3(0, snap_distance, 0)
		
		velocity.y -= GRAVITY * delta # Gravity

	velocity = velocity.rotated(Vector3.UP, rotation.y)
	velocity =  move_and_slide_with_snap(velocity, snap, Vector3.UP, true, 4, 5)

# ----------------------------------
# Mouse controls

func _input(event):
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotation_degrees.y -= event.relative.x * mouse_sensitivity / 10 # Look left and right (yaw axis)
		$Camera.rotation_degrees.x -= event.relative.y * mouse_sensitivity / 10 # Look up and down (pitch axis)
		$Camera.rotation_degrees.x = clamp($Camera.rotation_degrees.x, -90, 90) # Clamps the up and down rotation