extends Area2D

var lifespan = 2
var speed = 20

func _process(delta):
	position.y += -speed
	
	if not $VisibilityNotifier2D.is_on_screen():
		queue_free()