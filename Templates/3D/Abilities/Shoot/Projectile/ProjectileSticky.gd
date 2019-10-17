extends RigidBody

export (PackedScene) var impact
export var lifespan = 3.0

var target
var target_coordinates = Vector3()
var current_coordinates = Vector3()
var offset = Vector3()

var particles_spawned = false

func _ready():
	add_collision_exception_with(self)

	if lifespan > 0:
		yield(get_tree().create_timer(lifespan), "timeout")
		queue_free()

func _on_ProjectileSticky_body_entered(body):
	if body.is_in_group("Player") == false:
		axis_lock_linear_z = true
		axis_lock_linear_x = true
		axis_lock_linear_y = true
		axis_lock_angular_x = true
		axis_lock_angular_y = true
		axis_lock_angular_z = true
		sleeping = true

		if particles_spawned == false:
			var impact_instance = impact.instance() # We instance the scene
			
			add_child(impact_instance) # The instance is added as a child of the shoot node
			impact_instance.set_as_toplevel(true)
			particles_spawned = true