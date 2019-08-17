extends RayCast

export (PackedScene) var impact

func _input(event):
	if event is InputEventMouseButton and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event.button_index == 1 and event.pressed == true:
			if is_colliding():
				var explosion = impact.instance() # We instance the scene
		
				add_child(explosion) # The instance is added as a child of the shoot node
				explosion.set_as_toplevel(true)
				explosion.translation = get_collision_point()
			
				# You can delete those lines depending on your games:
				# Targets
				if "health" in get_collider(): # check if the object has health
					get_collider().health -= 1 # Remove one health in the script
					print(get_collider().health)
				
				# Spawn cubes
				if get_collider().has_method("spawn"): # check if the object has health
					get_collider().spawn()