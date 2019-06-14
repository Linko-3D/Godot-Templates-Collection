extends RayCast

var target
var i = 0

func _process(delta):	
	target = get_tree().get_root().find_node("FirstPersonCharacter", true, false) # Get the target node by his name
	
	if get_collider() == target:
		$AnimationPlayer.stop()
		look_at(target.translation, Vector3.UP) # Look at the target
	else:
		$AnimationPlayer.play()