extends Area2D

func _on_Coin_body_entered(body):
	if "coins" in body: # If the object colliding has a counter of coins collected (a player)
		body.coins += 1
		queue_free()