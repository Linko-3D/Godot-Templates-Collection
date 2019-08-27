extends Area

func _process(delta):
	pass

func _on_Pick_body_entered(body):
	if body.is_in_group("Player"):
		queue_free()