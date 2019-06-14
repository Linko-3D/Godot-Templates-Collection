extends RayCast

var target
var i = 0

func _process(delta):
	rotate_y(.1)
	
	target = get_tree().get_root().find_node("FirstPersonCharacter", true, false) # Get the target node by his name
	
	if get_collider() == target:
		i+= 1
		print(i, " I see you")