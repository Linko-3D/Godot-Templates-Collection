extends Position3D

export (PackedScene) var bullet
export var force = 25.0
export var fire_rate = 1.0

func _ready():
	$Timer.wait_time = fire_rate
	_on_Timer_timeout() # Initial shot

func _process(delta):
	if $Timer.is_stopped():
		$Timer.start()


func _on_Timer_timeout():
	var projectile = bullet.instance() # We instance the scene
	
	add_child(projectile) # The instance is added as a child of the shoot node
	projectile.set_as_toplevel(true) # Projectile parented to the highest node in the level to detach it from the player
	projectile.linear_velocity = global_transform.basis.z * -force # An initial force is applied when clicking, the force is applied on each new instance
