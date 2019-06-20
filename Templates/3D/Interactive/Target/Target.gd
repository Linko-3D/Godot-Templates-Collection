extends StaticBody

var health = 3

func _process(delta):
	if health <= 0:
		queue_free()