extends Area

export var mass_trigger = 100
var total_mass = 0

func _on_GroundButton_body_entered(body):
	if body.get_class() == "RigidBody":
		print("+", body.mass, "kg")
		total_mass += body.mass
		print("Total mass: ", total_mass, "kg\n")
		
		if total_mass >= mass_trigger:
			print("** Triggered **\n")


func _on_GroundButton_body_exited(body):
	if body.get_class() == "RigidBody":
		print("-", body.mass, "kg")
		total_mass -= body.mass
		print("Total mass: ", total_mass, "kg\n")
	
	if total_mass < mass_trigger:
		print("** Untriggered** \n")