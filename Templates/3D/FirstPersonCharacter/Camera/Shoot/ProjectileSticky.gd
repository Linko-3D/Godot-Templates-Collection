extends RigidBody

var lifespan = 3

func _ready():
	friction = 0
	$Timer.wait_time = lifespan
	$Timer.start()

func _on_Timer_timeout():
	queue_free()

func _on_Area_body_entered(body):
	axis_lock_linear_x = true
	axis_lock_linear_y = true
	axis_lock_linear_z = true