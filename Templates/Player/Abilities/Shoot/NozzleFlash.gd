extends Position3D

func _on_Lifetime_timeout():
	queue_free()
