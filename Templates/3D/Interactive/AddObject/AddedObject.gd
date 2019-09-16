extends StaticBody

func _process(delta):
	rotation = Vector3()
	
	translation.x = round(translation.x)
	translation.y = round(translation.y)
	translation.z = round(translation.z)