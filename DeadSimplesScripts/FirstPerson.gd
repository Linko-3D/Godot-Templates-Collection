extends KinematicBody

export var speed = 6.5
export var jump_force = 5
export var mouse_sensitivity = 1.0

var vector = Vector3()
var gravity = 9.8

func _physics_process(delta):
	var axis = Vector2()
	axis = axis.normalized()
	
	axis.y += -Input.get_action_strength("ui_up") + Input.get_action_strength("ui_down")
	axis.x += -Input.get_action_strength("ui_left") + Input.get_action_strength("ui_right")
	
	vector.z = axis.y * speed
	vector.x = axis.x * speed
	vector.y -= gravity * delta
	
	vector = vector.rotated(Vector3.UP, rotation.y)
	
	if is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		vector.y = jump_force
	
	vector = move_and_slide(vector, Vector3.UP)
	
func _input(event):
	if event is InputEventMouseMotion:
		rotation_degrees.y -= event.relative.x * mouse_sensitivity / 10
		rotation_degrees.x = clamp(rotation_degrees.x - event.relative.y / 10, -90, 90)