extends Node

var file = File.new()
var path = "user://save.dat"
var default_data = {"Name" : "Godette", "Level" : 1}

var data = {}

func _ready():
	if not file.file_exists(path):
		save_data(default_data)
	load_data()
	data["Level"] += 1 # Demo of changing a value
	update_data()

func save_data(data):
	file.open(path, File.WRITE)
	file.store_line(to_json(data))
	file.close()
	print("Data saved!")

func load_data():
	file.open(path, File.READ)
	data = parse_json(file.get_as_text())
	file.close()
	print("Data Loaded! " + str(data))

func update_data():
	save_data(data)
	load_data()
