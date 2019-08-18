extends StaticBody

export (Vector3) var MoveTo

func _process(delta):
	print(translation)
	$Tween.interpolate_property(self, "translation", translation, MoveTo, 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN, 0)