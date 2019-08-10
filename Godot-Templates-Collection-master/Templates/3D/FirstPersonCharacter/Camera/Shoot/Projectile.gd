extends RigidBody

var lifespan = 3

func _ready():
	$Timer.wait_time = lifespan
	$Timer.start()


func _on_Timer_timeout():
	queue_free()