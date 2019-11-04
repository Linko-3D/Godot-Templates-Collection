extends Control

var path = "user://save.txt"
var file = File.new()
var content = ""
# Saved here: C:\Users\NAME\AppData\Roaming\Godot\app_userdata\PROJECT

func _ready():
	write()
	read()

func write():
	file.open(path, File.WRITE)
	file.store_line("abc")
	file.close()
	print(file.file_exists(path))

func read():
	file.open(path, File.READ)
	content = file.get_as_text()
	print(content)
	file.close()
