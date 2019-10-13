extends Area

func _on_Water_body_entered(body):
	if body.is_in_group("Player"):
		print("In water")
