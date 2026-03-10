extends Control

@onready var lvl_1: Button = $CanvasLayer/VBoxContainer/HBoxContainer/lvl1
@onready var lvl_2: Button = $CanvasLayer/VBoxContainer/HBoxContainer/lvl2
@onready var lvl_3: Button = $CanvasLayer/VBoxContainer/HBoxContainer/lvl3
@onready var lvl_4: Button = $CanvasLayer/VBoxContainer/HBoxContainer/lvl4
@onready var lvl_5: Button = $CanvasLayer/VBoxContainer/HBoxContainer/lvl5
@onready var lvl_6: Button = $CanvasLayer/VBoxContainer/HBoxContainer/lvl6
@onready var lvl_7: Button = $CanvasLayer/VBoxContainer/HBoxContainer/lvl7
@onready var lvl_8: Button = $CanvasLayer/VBoxContainer/HBoxContainer/lvl8
@onready var lvl_9: Button = $CanvasLayer/VBoxContainer/HBoxContainer/lvl9
@onready var lvl_10: Button = $CanvasLayer/VBoxContainer/HBoxContainer/lvl10
@onready var lvl_11: Button = $CanvasLayer/VBoxContainer/HBoxContainer2/lvl11
@onready var lvl_12: Button = $CanvasLayer/VBoxContainer/HBoxContainer2/lvl12
@onready var lvl_13: Button = $CanvasLayer/VBoxContainer/HBoxContainer2/lvl13
@onready var lvl_14: Button = $CanvasLayer/VBoxContainer/HBoxContainer2/lvl14
@onready var lvl_15: Button = $CanvasLayer/VBoxContainer/HBoxContainer2/lvl15
@onready var lvl_16: Button = $CanvasLayer/VBoxContainer/HBoxContainer2/lvl16
@onready var lvl_17: Button = $CanvasLayer/VBoxContainer/HBoxContainer2/lvl17
@onready var lvl_18: Button = $CanvasLayer/VBoxContainer/HBoxContainer2/lvl18
@onready var lvl_19: Button = $CanvasLayer/VBoxContainer/HBoxContainer2/lvl19
@onready var lvl_20: Button = $CanvasLayer/VBoxContainer/HBoxContainer2/lvl20
@onready var lvl_21: Button = $CanvasLayer/VBoxContainer/HBoxContainer3/lvl21
@onready var lvl_22: Button = $CanvasLayer/VBoxContainer/HBoxContainer3/lvl22
@onready var lvl_23: Button = $CanvasLayer/VBoxContainer/HBoxContainer3/lvl23
@onready var lvl_24: Button = $CanvasLayer/VBoxContainer/HBoxContainer3/lvl24
@onready var lvl_25: Button = $CanvasLayer/VBoxContainer/HBoxContainer3/lvl25
@onready var lvl_26: Button = $CanvasLayer/VBoxContainer/HBoxContainer3/lvl26
@onready var lvl_27: Button = $CanvasLayer/VBoxContainer/HBoxContainer3/lvl27
@onready var lvl_28: Button = $CanvasLayer/VBoxContainer/HBoxContainer3/lvl28
@onready var lvl_29: Button = $CanvasLayer/VBoxContainer/HBoxContainer3/lvl29
@onready var lvl_30: Button = $CanvasLayer/VBoxContainer/HBoxContainer3/lvl30


func _ready() -> void:
	Global.load_progress()
	#Global.reset()#อย่าลืมเอาออก
	$CanvasLayer/back.focus_mode = Control.FOCUS_NONE
	lvl_1.disabled = false
	lvl_2.disabled = Global.unlocked_levels < 2
	lvl_3.disabled = Global.unlocked_levels < 3
	lvl_4.disabled = Global.unlocked_levels < 4
	lvl_5.disabled = Global.unlocked_levels < 5
	lvl_6.disabled = Global.unlocked_levels < 6
	lvl_7.disabled = Global.unlocked_levels < 7
	lvl_8.disabled = Global.unlocked_levels < 8
	lvl_9.disabled = Global.unlocked_levels < 9
	lvl_10.disabled = Global.unlocked_levels < 10
	lvl_11.disabled = Global.unlocked_levels < 11
	lvl_12.disabled = Global.unlocked_levels < 12
	lvl_13.disabled = Global.unlocked_levels < 13
	lvl_14.disabled = Global.unlocked_levels < 14
	lvl_15.disabled = Global.unlocked_levels < 15
	lvl_16.disabled = Global.unlocked_levels < 16
	lvl_17.disabled = Global.unlocked_levels < 17
	lvl_18.disabled = Global.unlocked_levels < 18
	lvl_19.disabled = Global.unlocked_levels < 19
	lvl_20.disabled = Global.unlocked_levels < 20
	lvl_21.disabled = Global.unlocked_levels < 21
	lvl_22.disabled = Global.unlocked_levels < 22
	lvl_23.disabled = Global.unlocked_levels < 23
	lvl_24.disabled = Global.unlocked_levels < 24
	lvl_25.disabled = Global.unlocked_levels < 25
	lvl_26.disabled = Global.unlocked_levels < 26
	lvl_27.disabled = Global.unlocked_levels < 27
	lvl_28.disabled = Global.unlocked_levels < 28
	lvl_29.disabled = Global.unlocked_levels < 29
	lvl_30.disabled = Global.unlocked_levels < 30

func _on_back_pressed() -> void:
	GlobleSound.play_sound("res://asset/btnSound.mp3")
	get_tree().change_scene_to_file("res://scenes/start.tscn")


func _on_lvl_1_pressed() -> void:
	GlobleSound.play_sound("res://asset/btnSound.mp3")
	get_tree().change_scene_to_file("res://scenes/pattern1/nomal_pattern_1.tscn")


func _on_lvl_2_pressed() -> void:
	if Global.unlocked_levels >= 2:
		GlobleSound.play_sound("res://asset/btnSound.mp3")
		get_tree().change_scene_to_file("res://scenes/pattern1/nomal_pattern_1_lvl_2.tscn")


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
