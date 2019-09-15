extends Area

export var ID = 0

func _on_Interuptor_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().call_group("Triggered", "Trigger(ID)")
		print("inside")

func _on_Interuptor_body_exited(body):
	if body.is_in_group("Player"):
		print("outside")