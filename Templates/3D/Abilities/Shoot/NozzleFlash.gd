extends Position3D

var hold_shoot = false

func _process(delta):
	if hold_shoot:
		$OmniLight.light_energy = 1
		$OmniLight.light_indirect_energy = 1
	else:
		$OmniLight.light_energy = 0
		$OmniLight.light_indirect_energy = 0

func _input(event): 
	if event is InputEventMouseButton and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event.button_index == 1 and event.pressed == true:
			hold_shoot = true
		if event.button_index == 1 and event.pressed == false:
			hold_shoot = false