extends KinematicBody

var target = "FirstPersonCharacter"
var targetPosition
var vector = Vector3()
var speed = 1

func _process(delta):
	targetPosition = get_tree().get_root().find_node(target, true, false)
	vector = ((translation - targetPosition.translation)*-1).normalized()
	move_and_slide(vector * speed)