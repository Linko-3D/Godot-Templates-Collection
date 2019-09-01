extends StaticBody

func _process(delta):
	if $Tween.is_active() == false: # Each time the animation stops check the direction set
		$Tween.start()