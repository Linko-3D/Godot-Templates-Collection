extends RayCast

#WIP
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.pressed == true:
			print(get_collider())