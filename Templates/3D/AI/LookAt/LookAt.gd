extends Spatial

var target

func _ready():
	target = get_tree().get_root().find_node("FirstPersonCharacter", true, false) # Get the target node by his name

func _process(delta):
	look_at(target.translation, Vector3.UP) # Look at the target