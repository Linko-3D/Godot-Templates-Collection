extends RayCast

var target
var vector

func _ready():
	target = get_tree().get_nodes_in_group("Player")[0] # Get the first node in the group "Player"

func _input(event):
	if event is InputEventMouseButton and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event.button_index == 2 and event.pressed == true:
			if is_colliding():
				vector = (get_collision_point() - target.translation).normalized()
				print(vector)