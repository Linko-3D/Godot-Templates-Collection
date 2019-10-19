extends RayCast

export (PackedScene) var impact

func _process(delta):
	if get_collider() != null:
		if get_collider().is_in_group("Enemy"):
			print("Enemy!")
			
			
func _input(event):
	if event is InputEventMouseButton and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event.button_index == 1 and event.pressed == true:
			if is_colliding():
				var impact_instance = impact.instance() # We instance the scene
		
				add_child(impact_instance) # The instance is added as a child of the shoot node
				impact_instance.set_as_toplevel(true)
				impact_instance.translation = get_collision_point()