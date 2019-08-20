extends Area

func _on_Checkpoint_body_entered(body):
	if body.is_in_group("Player"):
		Singleton.spawn_location = translation