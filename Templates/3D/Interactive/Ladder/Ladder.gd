extends Area

var target
var lookUp = true

func _ready():
	target = get_tree().get_nodes_in_group("Player")[0] # Get the target with the first node in the Player group

	if target.camera.rotation_degrees.x >= 0:
		lookUp = true
	else:
		lookUp = false

func _on_Ladder_body_entered(body):
	if body.is_in_group("Player"):
		body.gravity = 0
		body.velocity.y = 0

func _on_Ladder_body_exited(body):
	if body.is_in_group("Player"):
		body.gravity = 9.8
