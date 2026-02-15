extends Control

@onready var normal: Button = $CanvasLayer/VBoxContainer/normal
@onready var Endless: Button = $"CanvasLayer/VBoxContainer/Endless mode"
#@onready var hard: Button = $"CanvasLayer/VBoxContainer/Endless mode/VBoxContainer/hard"
#@onready var medium: Button = $"CanvasLayer/VBoxContainer/Endless mode/VBoxContainer/medium"
#@onready var Easy: Button = $"CanvasLayer/VBoxContainer/Endless mode/VBoxContainer/Easy"

@onready var exit: Button = $CanvasLayer/exit

@onready var btn = $btnSound
var is_first_click = true

func _ready() -> void:
	Endless.focus_mode = Control.FOCUS_NONE
	exit.focus_mode = Control.FOCUS_NONE
	#Easy.focus_mode = Control.FOCUS_NONE
	#medium.focus_mode = Control.FOCUS_NONE
	#hard.focus_mode = Control.FOCUS_NONE
	normal.focus_mode = Control.FOCUS_NONE
	#Easy.visible = false
	#medium.visible = false
	#hard.visible = false
	Global.load_progress()

func _on_endless_mode_pressed() -> void:
	GlobleSound.play_sound("res://asset/btnSound.mp3")
	get_tree().change_scene_to_file("res://scenes/mainEasy.tscn")
	#if is_first_click:
		#is_first_click = false
		#GlobleSound.play_sound("res://asset/btnSound.mp3")
		##Easy.visible = true
		##medium.visible = true
		##hard.visible = true
	#else:
		#is_first_click = true
		#GlobleSound.play_sound("res://asset/btnSound.mp3")
		##Easy.visible = false
		##medium.visible = false
		##hard.visible = false


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
