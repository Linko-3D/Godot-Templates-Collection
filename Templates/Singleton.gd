extends Node

var player
var spawn_location = Vector3(0, 3, 0)

func _ready():
	player = get_tree().get_nodes_in_group("Player")[0] # Get the target with the first node in the Player group
	player.translation = spawn_location

func _process(delta):
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()
		player.translation = spawn_location
	
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()