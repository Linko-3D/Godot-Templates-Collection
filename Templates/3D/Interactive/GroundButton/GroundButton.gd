extends Area

export var trigger_mass = 100
export var trigger_ID = 0

var total_mass = 0

var enable = false

func _on_GroundButton_body_entered(body):
	if body.get_class() == "RigidBody":
		print("+", body.mass, "kg")
		total_mass += body.mass
		print("Total mass: ", total_mass, "kg\n")

		if total_mass >= trigger_mass:
			enable = true
			get_tree().call_group("Triggered", "trigger", trigger_ID, enable)

func _on_GroundButton_body_exited(body):
	if body.get_class() == "RigidBody":
		print("-", body.mass, "kg")
		total_mass -= body.mass
		print("Total mass: ", total_mass, "kg\n")

	if total_mass < trigger_mass:
		enable = false
		get_tree().call_group("Triggered", "trigger", trigger_ID, enable)