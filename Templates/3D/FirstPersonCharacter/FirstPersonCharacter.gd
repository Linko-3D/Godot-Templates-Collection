extends KinematicBody

const GRAVITY = 9.8

export var speed = 6.0
export var jump_height = 6.5
export var mouse_sensitivity = 0.15

var velocity = Vector3()
var snap_distance = -0.1
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
	
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()

	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
		
	velocity =  move_and_slide_with_snap(velocity, snap, Vector3.UP, true, 4, 5)
	
# ----------------------------------
# Mouse controls

func _input(event): 
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotation.y += deg2rad(-event.relative.x * mouse_sensitivity) # yaw axis
		$Head.rotation.x += deg2rad(-event.relative.y * mouse_sensitivity) # pitch axis
		$Head.rotation.x = clamp($Head.rotation.x, deg2rad(-90), deg2rad(90)) # clamps the up and down rotation