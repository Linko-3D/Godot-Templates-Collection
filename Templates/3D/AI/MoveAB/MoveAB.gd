extends KinematicBody

export (Vector3) var MoveTo
var forward = true
var starting_position

func _ready():
	starting_position = translation

func _process(delta):
	if $Tween.is_active() == false: # Each time the animation stops check the direction set
		if forward:
			$Tween.start()
			$Tween.interpolate_property(self, "translation", translation, MoveTo, 2, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, 0)
			forward = false
		else:
			$Tween.start()
			$Tween.interpolate_property(self, "translation", translation, starting_position, 2, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, 0)
			forward = true