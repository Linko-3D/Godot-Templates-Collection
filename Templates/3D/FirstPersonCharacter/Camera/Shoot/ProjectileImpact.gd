extends RigidBody

var lifespan = 3

func _ready():
	yield(get_tree().create_timer(lifespan), "timeout")
	queue_free()