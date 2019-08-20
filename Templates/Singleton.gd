extends Node

var player
var checkpoint = Vector3(0, 3, 0)
var spawned = false

func _ready():
	player = get_tree().get_nodes_in_group("Player")[0] # Get the target with the first node in the Player group


func _process(delta):
	if spawned == false:
		player.translation = checkpoint
		spawned = true