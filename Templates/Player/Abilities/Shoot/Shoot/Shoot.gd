extends RayCast

export var autoFire = true
export var bullet_speed = 500.0
export var shell_speed = 10.0
export (PackedScene) var bullet
export (PackedScene) var nozzle_flash
export (PackedScene) var shell
export (PackedScene) var impact
export (PackedScene) var blood

var player

var hold = false

func _ready():
	visible = true
	player = get_tree().get_nodes_in_group("Player")[0] # Get the target with the first node in the Player group
	add_exception(player)

func _process(delta):
	$Crosshair.position = Vector2(OS.window_size.x / 2, OS.window_size.y / 2)
	$CrosshairHit.position = Vector2(OS.window_size.x / 2, OS.window_size.y / 2)

	if autoFire and hold:
		if $FireRate.is_stopped():
			shoot()
			$FireRate.start()

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.pressed == true:
			hold = true
			if autoFire == false:
				shoot()
		else:
			hold = false

func shoot():
	if is_colliding():
		if get_collider().get_class() == "StaticBody":
			if impact != null:				# If we have imported a scene for the impact
				impact()
		if get_collider().has_method("damage"):
			damage()
			get_collider().damage()
			
		$NozzlePosition.look_at(get_collision_point(), Vector3.UP)
	else:
		$NozzlePosition.rotation = Vector3()
		
	if bullet != null:						# If we have imported a scene for the bullet
		spawn_bullet()
	if shell != null:						# If we have imported a scene for the shell
		spawn_shell()
	if nozzle_flash != null:
		nozzle_flash()

func damage():
	$CrosshairHit.visible = true
	yield(get_tree().create_timer(0.05), "timeout")
	$CrosshairHit.visible = false

# Different scenes to spawn:

func impact():
	var impact_instance = impact.instance()

	get_tree().get_root().add_child(impact_instance)
	impact_instance.global_transform.origin = get_collision_point()

func nozzle_flash():
	var nozzle_flash_instance = nozzle_flash.instance()
	
	add_child(nozzle_flash_instance)
	nozzle_flash_instance.global_transform = $NozzlePosition.global_transform
		
func spawn_bullet():
	var bullet_instance = bullet.instance()
	
	get_tree().get_root().add_child(bullet_instance)
	bullet_instance.global_transform = $NozzlePosition.global_transform
	bullet_instance.linear_velocity = $NozzlePosition.global_transform.basis.z * - bullet_speed # Force applied

func spawn_shell():
	var shell_instance = shell.instance()
	
	get_tree().get_root().add_child(shell_instance)
	shell_instance.global_transform = $NozzlePosition/ShellPosition.global_transform
	shell_instance.linear_velocity = $NozzlePosition/ShellPosition.global_transform.basis.y * shell_speed
