extends RayCast

export var bullet_speed = 500.0
export var shell_speed = 10.0
export (PackedScene) var bullet
export (PackedScene) var nozzle_flash
export (PackedScene) var shell
export (PackedScene) var impact
export (PackedScene) var blood

var player

func _ready():
	player = get_tree().get_nodes_in_group("Player")[0] # Get the target with the first node in the Player group
	add_exception(player)
	$Crosshair.position = Vector2(OS.window_size.x / 2, OS.window_size.y / 2)
	$CrosshairHit.position = Vector2(OS.window_size.x / 2, OS.window_size.y / 2)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.pressed == true:
			if bullet != null:
				spawn_bullet()
			if shell != null:
				spawn_shell()
			
			if is_colliding():
				if get_collider().get_class() == "StaticBody":
					if impact != null:
						impact()
				if get_collider().has_method("damage"):
					show_hit()
					get_collider().damage()
				$NozzlePosition.look_at(get_collision_point(), Vector3.UP)
			else:
				$NozzlePosition.rotation = Vector3()

func show_hit():
	$CrosshairHit.visible = true
	yield(get_tree().create_timer(0.1), "timeout")
	$CrosshairHit.visible = false

func impact():
	var impact_instance = impact.instance() # We instance the scene

	add_child(impact_instance) # The instance is added as a child of the shoot node
	impact_instance.set_as_toplevel(true)
	impact_instance.global_transform.origin = get_collision_point()
	
func spawn_bullet():
	var bullet_instance = bullet.instance() # We instance the scene
	
	add_child(bullet_instance) # The instance is added as a child of the shoot node
	bullet_instance.set_as_toplevel(true) # Projectile parented to the highest node in the level to detach it from the player
	bullet_instance.global_transform.origin = $NozzlePosition.global_transform.origin
	bullet_instance.linear_velocity = $NozzlePosition.global_transform.basis.z * -bullet_speed # An initial force is applied when clicking, the force is applied on each new instance

func spawn_shell():
	var shell_instance = shell.instance()
	
	add_child(shell_instance)
	shell_instance.set_as_toplevel(true)
	shell_instance.global_transform.origin = $NozzlePosition/ShellPosition.global_transform.origin
	shell_instance.linear_velocity = $NozzlePosition/ShellPosition.global_transform.basis.y * shell_speed
