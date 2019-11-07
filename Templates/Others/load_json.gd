extends Node

var path = "user://data.json"
var file = File.new()

var default_data = {"Value 1": 5}

var data = { }

func _ready():
	load_game()

func load_game():
	if not file.file_exists(path):
		save_game()
		return

func save_game():
	file.open(path, File.WRITE)
	
	file.store_line(to_json(data))
	file.close()
