extends RigidBody

export var lifespan = 3.0

func _ready():
	yield(get_tree().create_timer(lifespan), "timeout")
	queue_free()