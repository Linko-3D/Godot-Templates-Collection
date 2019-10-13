extends Area

func _on_Water_body_entered(body):
	if body.is_in_group("Player"):
		body.swimming = true

func _on_Water_body_exited(body):
	if body.is_in_group("Player"):
		body.swimming = false
