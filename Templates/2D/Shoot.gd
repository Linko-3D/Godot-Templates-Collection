extends Position2D

var force = 25
export (PackedScene) var bullet

func _input(event): 
	if event is InputEventMouseButton and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event.button_index == 1 and event.pressed == true:
			shoot()

func shoot():
	var bullet_instance = bullet.instance() # We instance the scene
	get_tree().get_root().add_child(bullet_instance)
	bullet_instance.position = get_owner().position