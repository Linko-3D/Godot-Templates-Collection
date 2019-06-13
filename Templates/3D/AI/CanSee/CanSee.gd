extends Spatial

var target

func _process(delta):
	target = get_tree().get_root().find_node("FirstPersonCharacter", true, false) # Get the target node by his name
	#look_at(target.translation, Vector3.UP) # Look at the target
	#print($RayCast.get_collider())
	
	if $RayCast.get_collider() != null:
		look_at(target.translation, Vector3.UP) # Look at the target