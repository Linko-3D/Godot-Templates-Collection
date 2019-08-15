extends Node2D

var target 

func _ready():
	target = get_tree().get_root().find_node("CharacterTop", true, false)
	
func _process(delta):
	look_at(target.position) # Look at the target