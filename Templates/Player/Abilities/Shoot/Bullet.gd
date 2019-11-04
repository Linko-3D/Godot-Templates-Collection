extends RigidBody

var player

func _ready():
	gravity_scale = 0
	continuous_cd = true
	contact_monitor = true
	contacts_reported = 1
	can_sleep = false
	
	player = get_tree().get_nodes_in_group("Player")[0]
	add_collision_exception_with(player)
	
func _on_Projectile_body_entered(body):
	queue_free()

func _on_Lifetime_timeout():
	queue_free()
