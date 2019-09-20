extends RigidBody

var can_pick = false
var holding = false

func _process(delta):
	if can_pick and Input.is_action_just_pressed("interact"):
		holding = true
	if holding:
		global_transform = get_tree().get_root().find_node("Hold", true, false).get_global_transform()

func _on_Area_body_entered(body):
	if body.is_in_group("Player"):
		can_pick = true

func _on_Area_body_exited(body):
	if body.is_in_group("Player"):
		can_pick = false