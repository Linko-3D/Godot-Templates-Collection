extends Spatial

export (PackedScene) var projectile
export var force = 25.0
export var fire_rate = 0.01
export var recoil_angle = 3.0
export var spin_max = 0.3
export var spin_acceleration = 0.3
export var spin_start_firing = 0.2

var spin_speed = 0.0

var hold_shoot = false
var first_shoot = true # Remove recoil on the first shoot

func _ready():
	$Timer.wait_time = fire_rate

func _process(delta):
	rotate_z(spin_speed)
	if hold_shoot:
		spin_speed += spin_acceleration * delta
		if $Timer.is_stopped() and spin_speed >= spin_start_firing:
			$Timer.start()
	else:
		spin_speed -= spin_acceleration * delta
	spin_speed = clamp(spin_speed, 0, spin_max)

func _input(event): 
	if event is InputEventMouseButton and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event.button_index == 1 and event.pressed == true:
			hold_shoot = true
		if event.button_index == 1 and event.pressed == false:
			hold_shoot = false
			rotation_degrees.x = 0
			rotation_degrees.y = 0
			first_shoot = true
			$Timer.stop() # Stops the timer to avoid a shoot after the button is released

func _on_Timer_timeout():
	shoot()

func shoot():
	if first_shoot == true: # Remove recoil on the first shoot
		first_shoot = false
	else:
		rotation_degrees.x = rand_range(-recoil_angle,recoil_angle) # Recoil vibration
		rotation_degrees.y = rand_range(-recoil_angle,recoil_angle) # Recoil vibration
	
	var projectile_instance = projectile.instance() # We instance the scene

	$Nozzle.add_child(projectile_instance) # The instance is added as a child of the shoot node
	projectile_instance.set_as_toplevel(true) # Projectile parented to the highest node in the level to detach it from the player
	projectile_instance.linear_velocity = global_transform.basis.z * -force # An initial force is applied when clicking, the force is applied on each new instance