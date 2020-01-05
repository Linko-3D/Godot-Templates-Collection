# PAUSE SCRIPT

extends Node

func _ready():
	pause_mode = PAUSE_MODE_PROCESS # This script can't get paused in order to resume or quit the game
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(delta):
	# Pause the game and shows the mouse, if the game was already paused it quits the game
	if Input.is_action_just_pressed("ui_cancel"):
		if get_tree().paused:
			get_tree().quit()
		get_tree().paused = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _input(event):
	# If the left mouse button is pressed the game is resumed
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.pressed == true:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			get_tree().paused = false