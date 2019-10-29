extends KinematicBody

export var health = 3

func damage():
	health -= 1
	if health <= 0:
		queue_free()
