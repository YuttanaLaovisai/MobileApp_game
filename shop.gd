extends Node2D



func _on_back_pressed() -> void:
	GlobleSound.play_sound("res://asset/btnSound.mp3")
	get_tree().change_scene_to_file("res://scenes/start.tscn")


func _on_default_pressed() -> void:
	GlobalSkin.set_skin("res://skins/default.tres")


func _on_cat_pressed() -> void:
	GlobalSkin.set_skin("res://skins/cat.tres")
