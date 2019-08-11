extends StaticBody

var spawn = false

func _process(delta):
	if spawn:
		$Spawn.visible = true
		$Spawn/SpawnCollision.disabled = false
	#print(spawn)
