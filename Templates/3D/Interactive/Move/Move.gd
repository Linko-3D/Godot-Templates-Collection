extends StaticBody

export var speed = 1.0

var destination
var vector

func _ready():
	destination = $Destination.global_transform.origin

func _process(delta):
	if global_transform.origin != destination:
		vector = (destination - global_transform.origin).normalized()
		global_transform.origin += vector * speed * 0.1