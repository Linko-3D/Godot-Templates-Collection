extends Particles

var lifespan = lifetime

func _ready():
	print(lifespan)
	emitting = true
	yield(get_tree().create_timer(lifespan), "timeout")
	queue_free()