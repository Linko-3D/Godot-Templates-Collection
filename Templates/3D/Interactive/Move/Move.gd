extends KinematicBody

export var start_pause = 0.0
export var end_pause = 0.0

var vector

func _ready():
	vector = global_transform.origin - $Destination.global_transform.origin

func _process(delta):
	global_transform.origin -= vector * 0.003