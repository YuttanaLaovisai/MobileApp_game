extends Node

var coins: int = 200

var unlocked_skins = {
	"default": true,
	"cat": false,
	"dog": false
}

var current_skin: String = "default"


func unlock_skin(name: String, price: int) -> bool:
	if coins >= price:
		coins -= price
		unlocked_skins[name] = true
		save_data()
		return true
	return false


func use_skin(name: String):
	current_skin = name
	save_data()

func reset():
	unlocked_skins = {
	"default": true,
	"cat": false,
	"dog": false
	}
	save_data()

func save_data():
	var data = {
		"coins": coins,
		"unlocked": unlocked_skins,
		"current": current_skin
	}
	var file = FileAccess.open("user://shop.save", FileAccess.WRITE)
	file.store_var(data)


func load_data():
	if FileAccess.file_exists("user://shop.save"):
		var file = FileAccess.open("user://shop.save", FileAccess.READ)
		var data = file.get_var()
		coins = data["coins"]
		unlocked_skins = data["unlocked"]
		current_skin = data["current"]
