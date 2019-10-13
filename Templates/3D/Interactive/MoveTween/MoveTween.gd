extends KinematicBody

export var travel_seconds = 3.0
export var start_pause = 0.0
export var end_pause = 0.0

var moveTo = Vector3()
var starting_position = Vector3()
var forward = true

func _ready():
	starting_position = translation

func _process(delta):
	if $Tween.is_active() == false: # Each time the animation stops check the direction set
		if forward:
			$Tween.start()
			$Tween.interpolate_property(self, "translation", translation, $Destination.global_transform.origin, travel_seconds, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, start_pause)
			forward = false
		else:
			$Tween.start()
			$Tween.interpolate_property(self, "translation", translation, starting_position, travel_seconds, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, end_pause)
			forward = true