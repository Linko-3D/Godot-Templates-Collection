extends StaticBody

func _process(delta):
	rotation.x = 0
	rotation.z = 0
	
	translation.x = round(translation.x)
	translation.y = round(translation.y)
	translation.z = round(translation.z)