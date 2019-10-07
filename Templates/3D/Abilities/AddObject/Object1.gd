extends StaticBody

func _process(delta):
	rotation_degrees.y = stepify(rotation_degrees.y, 90)
	rotation.x = 0
	rotation.z = 0