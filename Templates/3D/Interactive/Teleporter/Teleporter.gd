extends Area

func _on_TeleporterA_body_entered(body):
	if body.is_in_group("Player"):
		body.translation = $Destination.global_transform.origin