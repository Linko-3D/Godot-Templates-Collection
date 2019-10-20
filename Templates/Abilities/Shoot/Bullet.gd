extends RigidBody

export var lifetime = 1.0

var player

func _ready():
	player = get_tree().get_nodes_in_group("Player")[0]
	add_collision_exception_with(player)
	
	if lifetime > 0:
		yield(get_tree().create_timer(lifetime), "timeout")
		queue_free()

func _on_Projectile_body_entered(body):
	yield(get_tree().create_timer(0.01), "timeout") # A delay is added to allow to push rigid bodies
	queue_free()