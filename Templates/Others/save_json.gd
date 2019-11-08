extends Node

var file = File.new()
var path = "user://save_game.dat"
var default_data = "{\"Name\" : \"Godette\"  , \"Level\" : \"1\"}"
var data

func _ready():
	if not file.file_exists(path):
		save(default_data)
	data = parse_json(loader())
	print(data.get("Level"))

func save(content):
	file.open(path, File.WRITE)
	file.store_line(content)
	file.close()

func loader():
	file.open(path, File.READ)
	var content = file.get_as_text()
	file.close()
	return content
