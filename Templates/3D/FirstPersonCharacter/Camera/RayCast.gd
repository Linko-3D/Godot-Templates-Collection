extends RayCast

func _input(event):
	if event is InputEventMouseButton and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event.button_index == 1 and event.pressed == true:
			if get_collider() != null and "health" in get_collider(): # check if the object has health
				get_collider().health -= 1 # Remove one health in the script