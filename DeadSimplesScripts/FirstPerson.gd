extends KinematicBody

export var speed = 6.5
export var jump_force = 5
export var mouse_sensitivity = 1.0

var movement = Vector3()
var snap_drection = Vector3.DOWN
var gravity = -9.8

func _physics_process(delta):
	var input_axis = Vector2()
	
	input_axis.y = -Input.get_action_strength("ui_up") + Input.get_action_strength("ui_down")
	input_axis.x = -Input.get_action_strength("ui_left") + Input.get_action_strength("ui_right")
	
	input_axis = input_axis.normalized()
	
	movement.z = input_axis.y * speed
	movement.x = input_axis.x * speed
	movement.y -= gravity * delta
	
	movement = movement.rotated($Head.global_transform.basis.y, $Head.rotation.y)
	
	if is_on_floor():
		snap_drection = Vector3.DOWN
		if Input.is_action_just_pressed("ui_accept"):
			snap_drection = Vector3.ZERO
			movement.y = jump_force
	
	movement = move_and_slide_with_snap(movement, snap_drection, Vector3.UP, true, 4, deg2rad(90))
	
func _input(event):
	if event is InputEventMouseMotion:
		$Head.rotation_degrees.y -= event.relative.x * mouse_sensitivity / 10
		$Head/Camera.rotation_degrees.x = clamp($Head/Camera.rotation_degrees.x - event.relative.y / 10, -90, 90)