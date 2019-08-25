extends Position3D

export (PackedScene) var bullet
export var force = 25.0
export var fire_rate = 0.1
export var recoil_angle = 2.0

var hold_shoot = false
var first_shoot = true # Remove recoil on the first shoot

func _ready():
	$Timer.wait_time = fire_rate

func _process(delta):
	if hold_shoot and $Timer.is_stopped():
		$Timer.start()

func _input(event): 
	if event is InputEventMouseButton and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event.button_index == 1 and event.pressed == true:
			_on_Timer_timeout() # Does a first shoot to avoid delay because the other shoots are done when the timer reaches at 0
			hold_shoot = true
		if event.button_index == 1 and event.pressed == false:
			hold_shoot = false
			rotation_degrees.x = 0
			rotation_degrees.y = 0
			first_shoot = true
			$Timer.stop() # Stops the timer to avoid a shoot after the button is released

func _on_Timer_timeout():
	if first_shoot == true: # Remove recoil on the first shoot
		first_shoot = false
	else:
		rotation_degrees.x = rand_range(-recoil_angle,recoil_angle) # Recoil vibration
		rotation_degrees.y = rand_range(-recoil_angle,recoil_angle) # Recoil vibration
	
	var projectile = bullet.instance() # We instance the scene

	add_child(projectile) # The instance is added as a child of the shoot node
	projectile.set_as_toplevel(true) # Projectile parented to the highest node in the level to detach it from the player
	projectile.linear_velocity = global_transform.basis.z * -force # An initial force is applied when clicking, the force is applied on each new instance

