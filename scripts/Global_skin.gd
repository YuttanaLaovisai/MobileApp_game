extends Node

const SAVE_PATH = "user://skin.save"
signal skin_changed

var current_skin: String = "res://skins/default.tres"

var unlocked_skins := {
	"default": true,
	"cat": false,
	"dog": false,
	"girl": false
}


func _ready():
	load_skin()

func reset():
	unlocked_skins = {
		"default": true,
		"cat": false,
		"dog": false,
		"girl": false
	}

	current_skin = "res://skins/default.tres"

	save_skin()

	skin_changed.emit() # ถ้าใช้ signal


func set_skin(path:String):
	current_skin = path
	save_skin()
	skin_changed.emit()


func unlock_skin(name: String):
	unlocked_skins[name] = true
	save_skin()


func save_skin():
	var data = {
		"current_skin": current_skin,
		"unlocked": unlocked_skins
	}

	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	file.store_var(data)
	file.close()


func load_skin():
	if not FileAccess.file_exists(SAVE_PATH):
		return

	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	var data = file.get_var()
	file.close()

	if typeof(data) == TYPE_DICTIONARY:
		current_skin = data.get("current_skin", current_skin)
		unlocked_skins = data.get("unlocked", unlocked_skins)
