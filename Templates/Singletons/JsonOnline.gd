extends HTTPRequest

func _ready():
	connect("request_completed", self, "_completed")
	request("https://api.myjson.com/bins/18tveq", PoolStringArray([]), false)

func _completed(result, response_code, headers, body):
	if response_code == 200:
		print(body.get_string_from_utf8())
