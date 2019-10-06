extends StaticBody

func _process(delta):
	rotation_degrees.y = stepify(rotation_degrees.y, 90)
	rotation.x = 0
	rotation.z = 0
	
	translation.x = stepify(translation.x, 4)
	translation.y = stepify(translation.y, 4)
	translation.z = stepify(translation.z, 4)