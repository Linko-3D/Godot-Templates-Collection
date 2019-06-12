extends Spatial

var target = "FirstPersonCharacter"
var playerPosition

func _process(delta):
	playerPosition = get_tree().get_root().find_node(target, true, false)
	look_at(playerPosition.translation, Vector3.UP)