extends KinematicBody

export (float) var offsetX
export (float) var offsetY
export (float) var offsetZ
export (float) var speed = 3
export (float) var start_pause = 0
export (float) var end_pause = 0

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
			$Tween.interpolate_property(self, "translation", translation, moveTo, speed, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, start_pause)
			forward = false
		else:
			$Tween.start()
			$Tween.interpolate_property(self, "translation", translation, starting_position, speed, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, end_pause)
			forward = true