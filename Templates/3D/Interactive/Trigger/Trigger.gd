extends Area

export var active = true
export var ID = 0

var enable = false

func _on_Interuptor_body_entered(body):
	if active and body.is_in_group("Player"):
		enable = true
		get_tree().call_group("Triggered", "trigger", ID, enable)

func _on_Interuptor_body_exited(body):
	if active and body.is_in_group("Player"):
		enable = false
		get_tree().call_group("Triggered", "trigger", ID, enable)