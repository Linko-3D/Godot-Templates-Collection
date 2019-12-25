extends KinematicBody

export var health = 10

func damage():
	print("hit")
	#health -= 1
	#if health <= 0:
	#	queue_free()
	pass
