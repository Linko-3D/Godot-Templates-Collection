extends KinematicBody

export var offsetX = 0.0
export var offsetY = 0.0
export var offsetZ = 0.0
export var travel_seconds = 3.0
export var start_pause = 0.0
export var end_pause = 0.0

var moveTo = Vector3()
var starting_position = Vector3()
var forward = true

func _ready():
	starting_position = translation
	moveTo.x = starting_position.x + offsetX
	moveTo.y = starting_position.y + offsetY
	moveTo.z = starting_position.z + offsetZ

func _process(delta):
	if $Tween.is_active() == false: # Each time the animation stops check the direction set
		if forward:
			$Tween.start()
			$Tween.interpolate_property(self, "translation", translation, moveTo, travel_seconds, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, start_pause)
			forward = false
		else:
			$Tween.start()
			$Tween.interpolate_property(self, "translation", translation, starting_position, travel_seconds, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, end_pause)
			forward = true