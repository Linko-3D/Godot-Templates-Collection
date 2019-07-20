extends Position3D

var force = 25
export (PackedScene) var bullet

func _input(event): 
	if event is InputEventMouseButton and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event.button_index == 1 and event.pressed == true:
			# We could have used this line bellow instead of exported variable, but this allows to rename and move the scene
			# var projectile = load("res://Templates/3D/FirstPersonCharacter/Camera/Shoot/Projectile.tscn").instance()
			
			var projectile = bullet.instance() # We instance the scene

			add_child(projectile) # The instance is added as a child of the shoot node
			projectile.set_as_toplevel(true) # Projectile parented to the highest node in the level to detach it from the player
			projectile.linear_velocity = global_transform.basis.z * -force # An initial force is applied