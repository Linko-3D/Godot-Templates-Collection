extends Spatial

var target

func _ready():
	target = get_tree().get_nodes_in_group("Player")[0] # Get the target with the first node in the Player group

func _process(delta):
	look_at(target.translation, Vector3.UP) # Look at the target