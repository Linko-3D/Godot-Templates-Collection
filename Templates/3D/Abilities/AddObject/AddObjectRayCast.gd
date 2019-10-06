extends RayCast

export (PackedScene) var object1

func _input(event):
	if event is InputEventMouseButton and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event.button_index == 3 and event.pressed == true:
			if is_colliding():
				var object_instance = object1.instance() # We instance the scene
		
				add_child(object_instance) # The instance is added as a child of the shoot node
				object_instance.set_as_toplevel(true)
				object_instance.translation = get_collision_point()