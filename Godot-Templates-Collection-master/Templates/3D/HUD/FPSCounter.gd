extends Label

func _process(delta):
	text = "FPS: " + str(Engine.get_frames_per_second())