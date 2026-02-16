extends Control

@onready var normal: Button = $CanvasLayer/VBoxContainer/normal
@onready var Endless: Button = $"CanvasLayer/VBoxContainer/Endless mode"
@onready var shop: Button = $CanvasLayer/VBoxContainer/Shop


@onready var exit: Button = $CanvasLayer/exit

@onready var btn = $btnSound
var is_first_click = true

func _ready() -> void:
	Endless.focus_mode = Control.FOCUS_NONE
	exit.focus_mode = Control.FOCUS_NONE
	shop.focus_mode = Control.FOCUS_NONE
	normal.focus_mode = Control.FOCUS_NONE
	Global.load_progress()

func _on_endless_mode_pressed() -> void:
	GlobleSound.play_sound("res://asset/btnSound.mp3")
	get_tree().change_scene_to_file("res://scenes/mainEasy.tscn")


func _on_normal_mode_pressed() -> void:
	GlobleSound.play_sound("res://asset/btnSound.mp3")
	get_tree().quit()


func _on_easy_pressed() -> void:
	GlobleSound.play_sound("res://asset/btnSound.mp3")
	get_tree().change_scene_to_file("res://scenes/mainEasy.tscn")


func _on_medium_pressed() -> void:
	GlobleSound.play_sound("res://asset/btnSound.mp3")
	get_tree().change_scene_to_file("res://scenes/mainMedium.tscn")


func _on_hard_pressed() -> void:
		GlobleSound.play_sound("res://asset/btnSound.mp3")
		get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_lvl_1_pressed() -> void:
		GlobleSound.play_sound("res://asset/btnSound.mp3")
		get_tree().change_scene_to_file("res://scenes/level.tscn")


func _on_shop_pressed() -> void:
		GlobleSound.play_sound("res://asset/btnSound.mp3")
		get_tree().change_scene_to_file("res://shop.tscn")
