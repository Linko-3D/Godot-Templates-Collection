extends Area

export var trigger_mass = 40
export var trigger_ID = 0

var total_mass = 0

func _on_GroundButton_body_entered(body):
	if body.get_class() == "RigidBody":
		total_mass += body.mass

		if total_mass >= trigger_mass:
			get_tree().call_group("Triggered", "trigger", trigger_ID, true)
			$Base/Button.translation.y = -0.1

func _on_GroundButton_body_exited(body):
	if body.get_class() == "RigidBody":
		total_mass -= body.mass

	if total_mass < trigger_mass:
		get_tree().call_group("Triggered", "trigger", trigger_ID, false)
		$Base/Button.translation.y = 0