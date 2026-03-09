extends Control

@onready var normal: Button = $CanvasLayer/VBoxContainer/normal
@onready var Endless: Button = $"CanvasLayer/VBoxContainer/HBoxContainer/Endless mode"
@onready var shop: Button = $CanvasLayer/VBoxContainer/Shop
@onready var expert: Button = $"CanvasLayer/VBoxContainer/Expert Endless mode"


@onready var exit: Button = $CanvasLayer/exit

@onready var btn = $btnSound
var is_first_click = true

func _ready() -> void:
	Global.load_progress()
	print(Global.hightest_score)
	expert.visible = Global.hightest_score > 10
	Endless.focus_mode = Control.FOCUS_NONE
	exit.focus_mode = Control.FOCUS_NONE
	shop.focus_mode = Control.FOCUS_NONE
	normal.focus_mode = Control.FOCUS_NONE
	expert.focus_mode = Control.FOCUS_NONE

func _on_endless_mode_pressed() -> void:
	GlobleSound.play_sound("res://asset/btnSound.mp3")
	get_tree().change_scene_to_file("res://scenes/mainEasy.tscn")


func _on_normal_mode_pressed() -> void:
	GlobleSound.play_sound("res://asset/btnSound.mp3")
	get_tree().quit()


func _on_lvl_1_pressed() -> void:
		GlobleSound.play_sound("res://asset/btnSound.mp3")
		get_tree().change_scene_to_file("res://scenes/level.tscn")


func _on_shop_pressed() -> void:
		GlobleSound.play_sound("res://asset/btnSound.mp3")
		get_tree().change_scene_to_file("res://shop.tscn")


func _on_expert_endless_mode_pressed() -> void:
	GlobleSound.play_sound("res://asset/btnSound.mp3")
	get_tree().change_scene_to_file("res://scenes/mainExpert.tscn")
