extends RayCast

export var pull_force = 1.0

var vector
var hold = false

func _process(delta):
	if is_colliding() and hold:
		if get_collider().get_class() == "RigidBody":
			vector = (get_collider().global_transform.origin - global_transform.origin).normalized()
			get_collider().global_transform.origin -= vector * pull_force * 0.1

func _input(event):
	if event is InputEventMouseButton and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event.button_index == 2 and event.pressed == true:
			hold = true
		if event.button_index == 2 and event.pressed == false:
			hold = false
			if get_collider().get_class() == "RigidBody":
				get_collider().can_sleep = false
				get_collider().set_mode(0)