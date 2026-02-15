extends Node

var current_skin: String = "res://skins/default.tres"

const SAVE_PATH = "user://skin.save"


func save_skin():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	file.store_var(current_skin)
	file.close()


func load_skin():
	if FileAccess.file_exists(SAVE_PATH):
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
		current_skin = file.get_var()
		file.close()


func set_skin(path:String):
	current_skin = path
	save_skin()
