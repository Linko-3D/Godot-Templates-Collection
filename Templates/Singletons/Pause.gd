extends Node

func _ready():
	pause_mode = PAUSE_MODE_PROCESS
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		if get_tree().paused:
			get_tree().quit()
		get_tree().paused = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

		#Save.update_data() # Enable if you want to save each time you pause, import the save.gd as singleton to make it work

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.pressed == true:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			get_tree().paused = false
