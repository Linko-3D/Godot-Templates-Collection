extends RayCast

export var bullet_speed = 100.0
export (PackedScene) var bullet
export (PackedScene) var impact
export (PackedScene) var blood


func _input(event):
	if event is InputEventMouseButton and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event.button_index == 1 and event.pressed == true:
			bullet()
			if is_colliding():
				impact()
				if get_collider().has_method("damage"):
					get_collider().damage()

func impact():
	var impact_instance = impact.instance() # We instance the scene

	add_child(impact_instance) # The instance is added as a child of the shoot node
	impact_instance.set_as_toplevel(true)
	impact_instance.global_transform.origin = get_collision_point()
	impact_instance.emitting
	impact_instance.one_shot
	
func bullet():
	var projectile_instance = bullet.instance() # We instance the scene
	
	add_child(projectile_instance) # The instance is added as a child of the shoot node
	projectile_instance.set_as_toplevel(true) # Projectile parented to the highest node in the level to detach it from the player
	projectile_instance.linear_velocity = global_transform.basis.z * -bullet_speed # An initial force is applied when clicking, the force is applied on each new instance