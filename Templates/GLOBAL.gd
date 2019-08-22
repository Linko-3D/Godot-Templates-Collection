extends Node

var player
var spawn_location = Vector3()

func _ready():
	player = get_tree().get_nodes_in_group("Player")[0] # Get the target with the first node in the Player group
	spawn_location = player.translation # Saving the starting position from the editor

func _process(delta):	
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()
		player = get_tree().get_nodes_in_group("Player")[0] # Get the target with the first node in the Player group
		player.translation = spawn_location # Using the latest spawn location saved
	
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()