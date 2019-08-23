extends RigidBody

var can_pick = false

func _on_Area_body_entered(body):
	if body.is_in_group("Player"):
		can_pick = true

func _on_Area_body_exited(body):
	if body.is_in_group("Player"):
		can_pick = false