extends Position3D

var force = 25

func _input(event): 
	if event is InputEventMouseButton and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event.button_index == 1 and event.pressed == true:
			var projectile = load("res://Templates/3D/FirstPersonCharacter/Camera/Shoot/Projectile.tscn").instance()
			add_child(projectile)
			projectile.set_as_toplevel(true)
			projectile.linear_velocity = global_transform.basis.z * -force