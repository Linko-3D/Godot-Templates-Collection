extends Spatial

var target = "FirstPersonCharacter"
var targetPosition

func _process(delta):
	targetPosition = get_tree().get_root().find_node(target, true, false)
	look_at(targetPosition.translation, Vector3.UP)