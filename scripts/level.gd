extends Control

@onready var lvl_1: Button = $CanvasLayer/VBoxContainer/lvl1
@onready var lvl_2: Button = $CanvasLayer/VBoxContainer/lvl2
@onready var lvl_3: Button = $CanvasLayer/VBoxContainer/lvl3
@onready var lvl_4: Button = $CanvasLayer/VBoxContainer/lvl4
@onready var lvl_5: Button = $CanvasLayer/VBoxContainer/lvl5


func _ready() -> void:
	Global.load_progress()
	#Global.reset()#อย่าลืมเอาออก
	$CanvasLayer/back.focus_mode = Control.FOCUS_NONE
	lvl_1.focus_mode = Control.FOCUS_NONE
	lvl_2.focus_mode = Control.FOCUS_NONE
	lvl_3.focus_mode = Control.FOCUS_NONE
	lvl_4.focus_mode = Control.FOCUS_NONE
	lvl_5.focus_mode = Control.FOCUS_NONE
	lvl_1.disabled = false
	lvl_2.disabled = Global.unlocked_levels < 2
	lvl_3.disabled = Global.unlocked_levels < 3
	lvl_4.disabled = Global.unlocked_levels < 4
	lvl_5.disabled = Global.unlocked_levels < 5
	


func _on_lvl_1_pressed() -> void:
	GlobleSound.play_sound("res://asset/btnSound.mp3")
	get_tree().change_scene_to_file("res://scenes/lvl_1.tscn")


func _on_back_pressed() -> void:
	GlobleSound.play_sound("res://asset/btnSound.mp3")
	get_tree().change_scene_to_file("res://scenes/start.tscn")


func _on_lvl_2_pressed() -> void:
	if Global.unlocked_levels >= 2:
		GlobleSound.play_sound("res://asset/btnSound.mp3")
		get_tree().change_scene_to_file("res://scenes/lvl_2.tscn")


func _on_lvl_3_pressed() -> void:
	if Global.unlocked_levels >= 3:
		GlobleSound.play_sound("res://asset/btnSound.mp3")
		get_tree().change_scene_to_file("res://scenes/lvl_4.tscn")


func _on_lvl_4_pressed() -> void:
	if Global.unlocked_levels >= 4:
		GlobleSound.play_sound("res://asset/btnSound.mp3")
		get_tree().change_scene_to_file("res://scenes/lvl_5.tscn")


func _on_lvl_5_pressed() -> void:
	if Global.unlocked_levels >= 5:
		GlobleSound.play_sound("res://asset/btnSound.mp3")
		get_tree().change_scene_to_file("res://scenes/lvl_6.tscn")
