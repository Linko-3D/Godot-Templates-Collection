extends RigidBody

export var lifespan = 3.0

func _ready():
	add_collision_exception_with(self)

	if lifespan > 0:
		yield(get_tree().create_timer(lifespan), "timeout")
		queue_free()