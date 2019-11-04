extends RayCast

export (PackedScene) var object

var snap = Vector3()

var player
var object_rotation = Vector3()

func _ready():
	player = get_tree().get_nodes_in_group("Player")[0]
	visible = true

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == 3 and event.pressed == true:
			if is_colliding() and object != null:
				var object_instance = object.instance()

				snap = get_collision_point()
				snap.x = stepify(get_collision_point().x, 2)
				snap.y = stepify(get_collision_point().y, 2)
				snap.z = stepify(get_collision_point().z, 2)
				
				get_tree().get_root().add_child(object_instance)
				object_instance.translation = snap
				object_rotation.y = stepify(player.rotation_degrees.y, 90)
				object_instance.rotation_degrees = object_rotation
