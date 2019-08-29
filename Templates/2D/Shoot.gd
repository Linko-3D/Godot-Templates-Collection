extends Position2D

var force = 25
export (PackedScene) var bullet

func _input(event): 
	if event is InputEventMouseButton and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event.button_index == 1 and event.pressed == true:
			shoot()

func shoot():
	var projectile = bullet.instance() # We instance the scene
	get_tree().get_root().add_child(projectile)
	projectile.position = get_owner().position