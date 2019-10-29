extends KinematicBody

export var speed = 1.0
export var start_pause = 1.0
export var end_pause = 1.0

var starting_position = Vector3()
var forward = true
var length = Vector3()

func _ready():
	starting_position = global_transform.origin
	var vector = $Destination.global_transform.origin - global_transform.origin
	length = vector.length()

func _process(delta):
	if $Tween.is_active() == false: # Each time the animation stops check the direction set
		if forward:
			$Tween.interpolate_property(self, "translation", translation, $Destination.global_transform.origin, 0.5/speed * length, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, start_pause)
			$Tween.start()
			forward = false
		else:
			$Tween.interpolate_property(self, "translation", translation, starting_position, 0.5/speed  * length, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, end_pause)
			$Tween.start()
			forward = true
