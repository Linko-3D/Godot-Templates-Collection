extends Area2D

var lifespan = 2
var speed = 20

func _ready():
	$Timer.wait_time = lifespan
	$Timer.start()

func _process(delta):
	position.y += -speed

func _on_Timer_timeout():
	queue_free()