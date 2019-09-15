extends StaticBody

export var max_distance = 5.0
export var speed = 0.1
export var pause = 1.0

export var limitLeft = -7.0
export var limitRight = 7.0
export var limitTop = 7.0
export var limitBottom = 1.0
export var limitFront = -2.0
export var limitBehind = -10.0

var moveTo = Vector3()

func _ready():
	moveTo = translation

func _process(delta):
	# Adds a limit on how far it can go in every directions
	if translation.x < limitLeft:
		translation.x = limitLeft
	if translation.x > limitRight:
		translation.x = limitRight
	if translation.y > limitTop:
		translation.y = limitTop
	if translation.y < limitBottom:
		translation.y = limitBottom
	if translation.z > limitFront:
		translation.z = limitFront
	if translation.z < limitBehind:
		translation.z = limitBehind

	if $Tween.is_active() == false: # Each time the animation stops check the direction set
		$Tween.start()
		moveTo = translation
		randomize()
		moveTo.x += rand_range(-max_distance, max_distance)
		moveTo.y += rand_range(-max_distance, max_distance)
		moveTo.z += rand_range(-max_distance, -max_distance)
		$Tween.interpolate_property(self, "translation", translation, moveTo, speed, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, pause)