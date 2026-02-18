extends Control
@onready var next: Button = $CanvasLayer/win/next
@onready var back: Button = $CanvasLayer/win/back

@export var lvlPath:String

func _ready() -> void:
	back.focus_mode = Control.FOCUS_NONE
	next.focus_mode = Control.FOCUS_NONE

func _on_back_pressed() -> void:
	GlobleSound.play_sound("res://asset/btnSound.mp3")
	get_tree().change_scene_to_file("res://scenes/level.tscn")


func _on_next_pressed() -> void:
	GlobleSound.play_sound("res://asset/btnSound.mp3")
	if not lvlPath == null:
		get_tree().change_scene_to_file(lvlPath)
	
