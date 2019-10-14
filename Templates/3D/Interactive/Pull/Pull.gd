extends RayCast

export var pull_force = 1.0

var vector
var hold = false

var object_grabbed = null

func _process(delta):
	if is_colliding() and hold:
		if get_collider().get_class() == "RigidBody":
			object_grabbed = get_collider()
			vector = (object_grabbed.global_transform.origin - global_transform.origin).normalized()
			object_grabbed.global_transform.origin -= vector * pull_force * 0.1

func _input(event):
	if event is InputEventMouseButton and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event.button_index == 2 and event.pressed == true:
			hold = true
		if event.button_index == 2 and event.pressed == false:
			hold = false
			if object_grabbed != null and object_grabbed.get_class() == "RigidBody":
				object_grabbed.can_sleep = false
				object_grabbed.set_mode(0)
				object_grabbed = null