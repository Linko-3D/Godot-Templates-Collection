extends Sprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = OS.window_size.x / 2
	position.y = OS.window_size.y / 2

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
