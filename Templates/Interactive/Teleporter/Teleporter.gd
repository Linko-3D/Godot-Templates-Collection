extends Area

func _on_Teleporter_body_entered(body):
	if body.is_in_group("Player"):
		body.translation = $Destination.global_transform.origin