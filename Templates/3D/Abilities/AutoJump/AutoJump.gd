extends Spatial

var character

var jumped = true

func _ready():
	character = get_owner()

func _process(delta):
	if character.is_on_floor() != true and jumped == false:
		character.vector.y = character.jump_height
		jumped = true
	if character.is_on_floor():
		jumped = false