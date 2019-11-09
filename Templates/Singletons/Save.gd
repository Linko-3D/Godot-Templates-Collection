extends Node

var file = File.new()
var path = "user://save.dat"
var default_data = {"Name" : "Godette", "Level" : 1}

var data = {}

func _ready():
	if not file.file_exists(path):
		save(default_data)
	data = parse_json(loader())
	print("Level: " + str(data["Level"]))

func save(data):
	file.open(path, File.WRITE)
	file.store_line(to_json(data))
	file.close()

func loader():
	file.open(path, File.READ)
	var data = file.get_as_text()
	file.close()
	return data
