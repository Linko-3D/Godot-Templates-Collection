extends Area

func _on_Checkpoint_body_entered(body):
	if body.is_in_group("Player"):
		GLOBAL.checkpoint = translation # Uses the current location of the checkpoint and use it as the new player spawn