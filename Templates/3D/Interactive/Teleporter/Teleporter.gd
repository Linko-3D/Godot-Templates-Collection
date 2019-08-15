extends Area

export(Vector3) var destination

func _on_TeleporterA_body_entered(body):
	if body.is_in_group("Player"):
		body.translation = destination