extends Area

export var active = true
export var trigger_ID = 0

func _on_Interuptor_body_entered(body):
	if active and body.is_in_group("Player"):
		get_tree().call_group("Triggered", "trigger", trigger_ID, true)

func _on_Interuptor_body_exited(body):
	if active and body.is_in_group("Player"):
		get_tree().call_group("Triggered", "trigger", trigger_ID, false)