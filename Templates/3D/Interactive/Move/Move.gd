extends KinematicBody

export var start_pause = 0.0
export var end_pause = 0.0

var vector

func _process(delta):
	vector = global_transform.origin - $Destination.global_transform.origin
	print(vector)
	