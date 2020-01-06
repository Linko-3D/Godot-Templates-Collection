extends KinematicBody

export var speed = 6.5
export var jump_force = 5
export var mouse_sensitivity = 1.0

var movement = Vector3()
var gravity = 9.8

var snap_length = 1
var snap_drection = Vector3()

func _physics_process(delta):
	var input_axis = Vector2()
	
	input_axis.y = -Input.get_action_strength("ui_up") + Input.get_action_strength("ui_down")
	input_axis.x = -Input.get_action_strength("ui_left") + Input.get_action_strength("ui_right")
	
	input_axis = input_axis.normalized()
	
	movement.z = input_axis.y * speed
	movement.x = input_axis.x * speed
	movement.y -= gravity * delta
	
	movement = movement.rotated(Vector3.UP, rotation.y)
	
	if is_on_floor():
		snap_drection = Vector3(0, -snap_length, 0)
		if Input.is_action_just_pressed("ui_accept"):
			snap_drection = Vector3()
			movement.y = jump_force
	
	movement = move_and_slide_with_snap(movement, snap_drection, Vector3.UP, false)
	
func _input(event):
	if event is InputEventMouseMotion:
		rotation_degrees.y -= event.relative.x * mouse_sensitivity / 10
		rotation_degrees.x = clamp(rotation_degrees.x - event.relative.y / 10, -90, 90)