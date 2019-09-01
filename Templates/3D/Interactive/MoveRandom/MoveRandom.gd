extends StaticBody

var max_distance = 2
var moveTo = Vector3()
var speed = 0.1
var pause = 1

var limitBottom = 1

func _ready():
	moveTo = translation

func _process(delta):
	if translation.y < limitBottom:
		translation.y = limitBottom

	if $Tween.is_active() == false: # Each time the animation stops check the direction set
		$Tween.start()
		moveTo = translation
		randomize()
		moveTo.x += rand_range(-max_distance, max_distance)
		moveTo.y += rand_range(-max_distance, max_distance)
		moveTo.z += rand_range(-max_distance, max_distance)
		$Tween.interpolate_property(self, "translation", translation, moveTo, speed, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, pause)