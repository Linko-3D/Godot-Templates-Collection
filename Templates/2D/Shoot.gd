extends Position2D

var force = 25

func _input(event): 
	if event is InputEventMouseButton and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event.button_index == 1 and event.pressed == true:
			var projectile = load("res://Templates/2D/Projectile.tscn").instance()
			add_child(projectile)
			#projectile.set_as_toplevel(true)