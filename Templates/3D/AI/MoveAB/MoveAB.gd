extends StaticBody

export (Vector3) var MoveTo

func _process(delta):
	#$Tween.interpolate_property(self, translation, translation, MoveTo, 1.0, 0, 0 ,0)
	pass