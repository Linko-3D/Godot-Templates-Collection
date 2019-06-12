extends Area

func _on_Area_body_entered(body):
	print("inside")

func _on_Area_body_exited(body):
	print("outside")
