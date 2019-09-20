extends TextEdit

func _process(delta):
	text = "FPS: " + str(Engine.get_frames_per_second()) + "\n" + str(OS.window_size.x) + "x" + str(OS.window_size.y)