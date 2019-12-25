extends KinematicBody

export var health = 1000

func damage():
	health -= 1
	print(health)
	if health <= 0:
		queue_free()
	pass
