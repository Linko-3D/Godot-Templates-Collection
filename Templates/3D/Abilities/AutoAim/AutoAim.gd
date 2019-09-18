extends RayCast

var target

func _process(delta):
	if target != null:
		$ArmPosition.look_at(target.translation, Vector3.UP)
	else:
		print('null')
		$ArmPosition.rotation = Vector3()
	
func _input(event):
	if event is InputEventMouseButton and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event.button_index == 2 and event.pressed == true:
			if is_colliding():
				target = get_collider()
			else:
				target = null