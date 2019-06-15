extends RayCast

var target

func _process(delta):
	target = get_tree().get_root().find_node("Projectile", true, false) # Get the target node by his name
	#print(target.translation)

	print(get_collider())

func _input(event):
	if event is InputEventMouseButton and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event.button_index == 1 and event.pressed == true:
			print(get_collision_point())
			if get_collider() != null: # check if the object has health
				target.translation = get_collision_point()
			
			
				#get_collider().health -= 1 # Remove one health in the script
				#print(get_collider().health)