extends KinematicBody2D

export var speed = 100
export var rot_speed = 0.1

var movement = Vector2()

func _process(delta):
	movement = Vector2()
	if Input.is_action_pressed("ui_up"):
		movement.y = -speed
	if Input.is_action_pressed("ui_down"):
		movement.y = speed
	if Input.is_action_pressed("ui_left"):
		rotate(-rot_speed)
	if Input.is_action_pressed("ui_right"):
		rotate(rot_speed)
		
	movement = movement.rotated(rotation)

	move_and_slide(movement)
