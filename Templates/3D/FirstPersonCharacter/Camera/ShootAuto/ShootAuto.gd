extends Position3D

var force = 25
var hold_shoot = false
var cadence = 0.1
export (PackedScene) var bullet

var projectile

func _ready():
	projectile = bullet.instance() # Avoid to have a lag on the first shoot by preloading the projectile
	$Timer.wait_time = cadence

func _process(delta):
	if hold_shoot and $Timer.is_stopped():
		$Timer.start()

func _input(event): 
	if event is InputEventMouseButton and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event.button_index == 1 and event.pressed == true:
			shoot() # Does a first shoot to avoid delay because the other shoots are done when the timer reaches at 0
			hold_shoot = true
		else:
			hold_shoot = false
			$Timer.stop() # Stops the timer to avoid a shoot after the button is released

func _on_Timer_timeout():
	shoot()

func shoot():
	projectile = bullet.instance() # We instance the scene

	add_child(projectile) # The instance is added as a child of the shoot node
	projectile.set_as_toplevel(true) # Projectile parented to the highest node in the level to detach it from the player
	projectile.linear_velocity = global_transform.basis.z * -force # An initial force is applied when clicking, the force is applied on each new instance