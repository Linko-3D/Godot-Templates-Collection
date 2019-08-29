extends KinematicBody2D

var velocity = Vector2()
var speed = 300
var rot_speed = 0.05

func _process(delta):
	print(deg2rad(90))
	velocity = Vector2()
	
	if Input.is_action_pressed("ui_up"):
		velocity = Vector2(speed, 0).rotated(rotation-deg2rad(90))
	if Input.is_action_pressed("ui_down"):
		velocity = Vector2(-speed, 0).rotated(rotation-deg2rad(90))
	
	if Input.is_action_pressed("ui_right"):
		rotate(rot_speed)
	if Input.is_action_pressed("ui_left"):
		rotate(-rot_speed)
	
	move_and_slide(velocity)

func _input(event):
	if event is InputEventMouseMotion:
		rotate(event.relative.x * 0.005)