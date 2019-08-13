extends RigidBody

var lifespan = 3
var target
var target_coordinates = Vector3()
var current_coordinates = Vector3()
var offset = Vector3()

func _ready():
	yield(get_tree().create_timer(lifespan), "timeout")
	queue_free()

func _process(delta):
	if target != null:
		translation = target.translation + offset

func _on_Area_body_entered(body):
	target = body
	target_coordinates = body.translation
	offset = translation - target_coordinates
	axis_lock_linear_z = true
	axis_lock_linear_x = true
	axis_lock_linear_y = true
	$Area.monitoring = false
