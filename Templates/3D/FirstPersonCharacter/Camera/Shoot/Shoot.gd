extends Position3D

var force = 25
export (PackedScene) var bullet

var projectile


func _input(event): 
	if event is InputEventMouseButton and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event.button_index == 1 and event.pressed == true:
			projectile = bullet.instance() # We instance the scene
	
			add_child(projectile) # The instance is added as a child of the shoot node
			projectile.set_as_toplevel(true) # Projectile parented to the highest node in the level to detach it from the player
			projectile.linear_velocity = global_transform.basis.z * -force # An initial force is applied when clicking, the force is applied on each new instance