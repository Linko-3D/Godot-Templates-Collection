extends KinematicBody

export var speed = 6.5
export var jump_height = 8.0
export var mouse_sensitivity = 1.0

var vector = Vector3()
var snap_vector = Vector3.DOWN
var gravity = 20.0

func _physics_process(delta):
	vector.x = 0
	vector.z = 0
	
	var UP = Input.is_action_pressed("ui_up")
	var DOWN = Input.is_action_pressed("ui_down")
	var LEFT = Input.is_action_pressed("ui_left")
	var RIGHT = Input.is_action_pressed("ui_right")
	var SPRINT = Input.is_action_pressed("sprint")
	
	vector += global_transform.basis.z * (-int(UP) + int(DOWN)) * (1 + int(SPRINT)) * speed 
	vector += global_transform.basis.x * (-int(LEFT) + int(RIGHT)) * (1 + int(SPRINT)) * speed 
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		snap_vector = Vector3.ZERO
		vector.y = jump_height
	else:
		snap_vector = Vector3.DOWN
	
	vector.y -= gravity * delta
	
	vector = move_and_slide_with_snap(vector, snap_vector, Vector3.UP, false, 4, PI, false)

func _input(event):
	if event is InputEventMouseMotion:
		rotation_degrees.y -= event.relative.x * mouse_sensitivity / 10			# Look left and right
		$Camera.rotation_degrees.x = clamp($Camera.rotation_degrees.x - event.relative.y * mouse_sensitivity / 10, -90, 90) # Look up and down
