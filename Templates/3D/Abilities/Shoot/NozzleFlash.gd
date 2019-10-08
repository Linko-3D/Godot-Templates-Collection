extends Position3D

var hold_shoot = false
var turned_On = false
var fire_rate = 0.1

func _process(delta):
	print(turned_On)
	if hold_shoot:
		flash()
	else:
		$OmniLight.light_energy = 0
		$OmniLight.light_indirect_energy = 0
		turned_On = false

func _input(event): 
	if event is InputEventMouseButton and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event.button_index == 1 and event.pressed == true:
			hold_shoot = true
		if event.button_index == 1 and event.pressed == false:
			hold_shoot = false

func flash():
	if turned_On == false:
		$OmniLight.light_energy = 1
		$OmniLight.light_indirect_energy = 1
		yield(get_tree().create_timer(fire_rate), "timeout")
		turned_On = true
	else:
		$OmniLight.light_energy = 0
		$OmniLight.light_indirect_energy = 0
		yield(get_tree().create_timer(fire_rate), "timeout")
		turned_On = false