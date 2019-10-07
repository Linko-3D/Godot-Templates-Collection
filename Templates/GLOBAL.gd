extends Node

var player
var checkpoint = Vector3()

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	player = get_tree().get_nodes_in_group("Player")[0] # Get the target with the first node in the Player group
	checkpoint = player.translation # Saving the starting position of the player for the initial checkpoint

func _process(delta):
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if Input.is_action_just_pressed("restart"):
			get_tree().reload_current_scene()
			player = get_tree().get_nodes_in_group("Player")[0]		# Get the target with the first node in the Player group
			player.global_transform.origin = checkpoint						# Using the latest spawn location saved
		if Input.is_action_just_pressed("ui_cancel"):
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		if Input.is_action_just_pressed("ui_cancel"):
			get_tree().quit()

func _input(event):
	if event is InputEventMouseButton and Input.get_mouse_mode() != Input.MOUSE_MODE_CAPTURED:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)