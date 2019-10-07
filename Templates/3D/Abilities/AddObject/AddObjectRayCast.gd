extends RayCast

export (PackedScene) var object1

var snap = Vector3()

var player
var object_rotation = Vector3()

func _ready():
	player = get_tree().get_nodes_in_group("Player")[0] # Get the target with the first node in the Player group

func _process(delta):
	
	object_rotation.y = stepify(player.rotation_degrees.y, 90)
	#print(object_rotation)
func _input(event):
	if event is InputEventMouseButton and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event.button_index == 3 and event.pressed == true:
			if is_colliding():
				var object_instance = object1.instance() # We instance the scene
				
				snap = get_collision_point()
				snap.x = stepify(get_collision_point().x, 4)
				snap.y = stepify(get_collision_point().y, 4)
				snap.z = stepify(get_collision_point().z, 4)
				
				add_child(object_instance) # The instance is added as a child of the shoot node
				object_instance.set_as_toplevel(true)
				object_instance.translation = snap
				object_instance.rotation_degrees = object_rotation