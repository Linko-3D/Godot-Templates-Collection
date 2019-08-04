extends KinematicBody2D

var speed = 150
var velocity = Vector2()

var coins = 0

func _physics_process(delta):
	velocity = Vector2()
	
	if Input.is_action_pressed("ui_up"):
		velocity.y = -1
	if Input.is_action_pressed("ui_down"):
		velocity.y = 1
	if Input.is_action_pressed("ui_left"):
		velocity.x = -1
	if Input.is_action_pressed("ui_right"):
		velocity.x = 1
	velocity = velocity.normalized() * speed
	
	move_and_slide(velocity)