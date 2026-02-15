extends Node

var unlocked_levels: int = 1
var hightest_score: float = 0.0

const SAVE_PATH = "user://savegame.save"
const SCORE_PATH = "user://highest.save"


func unlock_level(level: int) -> void:
	if level > unlocked_levels:
		unlocked_levels = level
		save_progress()


func save_progress():
	var save_data = {
		"unlocked_levels": unlocked_levels
	}

	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	file.store_var(save_data)
	file.close()


func load_progress():

	# load level
	if FileAccess.file_exists(SAVE_PATH):
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
		var save_data = file.get_var()
		file.close()

		if save_data.has("unlocked_levels"):
			unlocked_levels = save_data["unlocked_levels"]


	# load score
	if FileAccess.file_exists(SCORE_PATH):
		var file = FileAccess.open(SCORE_PATH, FileAccess.READ)
		var save_data = file.get_var()
		file.close()

		if save_data.has("highest"):
			hightest_score = save_data["highest"]


func save_hightest(score: float):

	# save เฉพาะถ้าสูงกว่าเดิม
	if score > hightest_score:
		hightest_score = score

		var save_data = {
			"highest": hightest_score
		}

		var file = FileAccess.open(SCORE_PATH, FileAccess.WRITE)
		file.store_var(save_data)
		file.close()


func reset():
	unlocked_levels = 1
	hightest_score = 0.0

	save_progress()
	save_hightest(0.0)
