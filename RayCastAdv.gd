extends RayCast

var target

func _ready():
	target = get_tree().get_root().find_node("Projectile", true, false) # Get the target node by his name

func _input(event):
	if event is InputEventMouseButton and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event.button_index == 1 and event.pressed == true:
			print(get_collision_point())
			if get_collider() != null: # check if the object has health
				target.translation = get_collision_point()