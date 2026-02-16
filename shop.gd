extends Node2D

@onready var back: Button = $CanvasLayer/back
@onready var coin: Label = $CanvasLayer/coin

func _ready() -> void:
	GlobalSkin.reset()
	GlobalCurrency.coin += 1000
	back.focus_mode = Control.FOCUS_NONE

func _process(delta: float) -> void:
	coin.text = "coin : " + str(GlobalCurrency.coin)

func _on_back_pressed() -> void:
	GlobleSound.play_sound("res://asset/btnSound.mp3")
	get_tree().change_scene_to_file("res://scenes/start.tscn")


func _on_cat_pressed() -> void:
	GlobleSound.play_sound("res://asset/btnSound.mp3")
	GlobalSkin.set_skin("res://skins/cat.tres")


func _on_default_2_pressed() -> void:
	GlobleSound.play_sound("res://asset/btnSound.mp3")
	GlobalSkin.set_skin("res://skins/default.tres")
