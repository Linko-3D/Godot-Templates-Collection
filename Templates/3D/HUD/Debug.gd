extends TextEdit

var min_FPS = 60

func _process(delta):
	text = "FPS: " + str(Engine.get_frames_per_second()) + "\n" + "Min: " + str(min_FPS) + "\n" + str(OS.window_size.x) + "x" + str(OS.window_size.y)
	
	yield(get_tree().create_timer(3), "timeout")
	
	if min_FPS > Engine.get_frames_per_second():
		min_FPS = Engine.get_frames_per_second()
