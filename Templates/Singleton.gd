extends Node

var player
var spawn_location = Vector3()

func _ready():
	player = get_tree().get_nodes_in_group("Player")[0] # Get the target with the first node in the Player group
	spawn_location = player.translation # Savng the starting position from the editor

func _process(delta):
	print(spawn_location)
	
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()
		player = get_tree().get_nodes_in_group("Player")[0] # Get the target with the first node in the Player group
		player.translation = spawn_location # Latest spawn location registered
	
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()