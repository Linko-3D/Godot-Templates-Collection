extends KinematicBody

export var speed = 6.5
export var jump_force = 5
export var mouse_sensitivity = 1.0

var vector = Vector3()
var gravity = 9.8

func _physics_process(delta):
	var direction = Vector2()
	
	if Input.get_action_strength("ui_up"):
		direction.y -= 1
	if Input.get_action_strength("ui_down"):
		direction.y += 1
	if Input.get_action_strength("ui_left"):
		direction.x -= 1
	if Input.get_action_strength("ui_right"):
		direction.x += 1
	direction = direction.normalized().rotated(-rotation.y)
	
	vector.z = direction.y * speed
	vector.x = direction.x * speed
	vector.y -= gravity * delta
	
	if is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		vector.y = jump_force
	
	vector = move_and_slide(vector, Vector3.UP)
	
func _input(event):
	if event is InputEventMouseMotion:
		rotation_degrees.y -= event.relative.x * mouse_sensitivity / 10
		rotation_degrees.x = clamp(rotation_degrees.x - event.relative.y / 10, -90, 90)