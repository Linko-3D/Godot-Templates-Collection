extends KinematicBody

const GRAVITY = 0.15

var velocity = Vector3()
var speed = 6
var max_falling_speed = 20
var jump_height = 4

var snap = Vector3.DOWN

var mouse_sensitivity = 0.15

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity.x = 0 # Resets the direction when no key is pressed
	velocity.z = 0
	
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if Input.is_action_pressed("ui_up"):
			velocity += -$Yaw.global_transform.basis.z * speed
		if Input.is_action_pressed("ui_down"):
			velocity += $Yaw.global_transform.basis.z * speed
		if Input.is_action_pressed("ui_left"):
			velocity += -$Yaw.global_transform.basis.x * speed
		if Input.is_action_pressed("ui_right"):
			velocity += $Yaw.global_transform.basis.x * speed
	
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			snap = Vector3()
			velocity.y = jump_height
		else:
			snap = Vector3.DOWN

	velocity.y -= GRAVITY # Gravity
	velocity.y = clamp(velocity.y, -max_falling_speed, max_falling_speed) # Max falling speed
		
	velocity =  move_and_slide_with_snap(velocity, snap, Vector3.UP, true, 4, 90)
	
func _input(event): 
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		$Yaw.rotate_y(deg2rad(-event.relative.x * mouse_sensitivity)) #yaw
		$Yaw/Pitch.rotate_x(deg2rad(-event.relative.y * mouse_sensitivity))
		$Yaw/Pitch.rotation.x = clamp($Yaw/Pitch.rotation.x, deg2rad(-50), deg2rad(0))