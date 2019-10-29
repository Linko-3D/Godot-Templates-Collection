extends KinematicBody

export var time = 3.0
export var start_pause = 1.0
export var end_pause = 1.0

var starting_position = Vector3()
var forward = true

func _ready():
	starting_position = global_transform.origin

func _process(delta):
	if $Tween.is_active() == false: # Each time the animation stops check the direction set
		if forward:
			$Tween.interpolate_property(self, "translation", translation, $Destination.global_transform.origin, time, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, start_pause)
			$Tween.start()
			forward = false
		else:
			$Tween.interpolate_property(self, "translation", translation, starting_position, time, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, end_pause)
			$Tween.start()
			forward = true
