extends KinematicBody

export var speed = 5
export var jump_height = 5
export var mouse_sensitivity = 1.0

var vector = Vector3()
var gravity = 9.8

func _physics_process(delta):
	vector.z = 0
	vector.x = 0
	
	if Input.is_action_pressed("ui_up"):
		vector.z = -1 * speed
	if Input.is_action_pressed("ui_down"):
		vector.z = 1 * speed
	if Input.is_action_pressed("ui_left"):
		vector.x = -1 * speed
	if Input.is_action_pressed("ui_right"):
		vector.x = 1 * speed
	
	if is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		vector.y = jump_height
	
	vector = vector.rotated(Vector3.UP, rotation.y)
	
	vector.y -= gravity * delta
	vector = move_and_slide(vector, Vector3.UP)



func _input(event):
	if event is InputEventMouseMotion:
		rotation_degrees.y -= event.relative.x * mouse_sensitivity / 10
		rotation_degrees.x = clamp(rotation_degrees.x - event.relative.y / 10, -90, 90)