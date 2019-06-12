extends Spatial

var target = "FirstPersonCharacter"
var targetPosition

func _process(delta):
	targetPosition = get_tree().get_root().find_node(target, true, false) # Get the target
	look_at(targetPosition.translation, Vector3.UP) # Look at the target