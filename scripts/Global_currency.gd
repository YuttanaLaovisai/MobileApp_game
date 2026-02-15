extends Node

var coin :int = 0
const COIN_PATH = "user://coin.save"
var can_collect = false

func _ready():
	load_coin()


func save_coin():
	var save_data = {"coin": coin}

	var file = FileAccess.open(COIN_PATH, FileAccess.WRITE)
	if file:
		file.store_var(save_data)
		file.close()


func load_coin():
	if not FileAccess.file_exists(COIN_PATH):
		return

	var file = FileAccess.open(COIN_PATH, FileAccess.READ)
	if file == null:
		return

	var save_data = file.get_var()
	file.close()

	if typeof(save_data) == TYPE_DICTIONARY and save_data.has("coin"):
		coin = save_data["coin"]
	else:
		coin = 0


func add_coin(add:int):
	coin += add
	save_coin()


func reset():
	coin = 0
	save_coin()
