extends Area

export var mass_trigger = 50

func _on_GroundButton_body_entered(body):
	if body.get_class() == "RigidBody":
		print(body.mass, " kg")
		if body.mass >= mass_trigger:
			print("Triggered")


func _on_GroundButton_body_exited(body):
	if body.get_class() == "RigidBody":
		if body.mass >= mass_trigger:
			print("Untriggered")
