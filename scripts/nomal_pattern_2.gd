extends Node2D

@onready var player: RigidBody2D = $player
@onready var player_home: Marker2D = $playerHome
@onready var egg = $egg
@onready var win: Control = $CanvasLayer/win_interface/CanvasLayer/win
@onready var eggg = $player/egg
@onready var objective: Label = $CanvasLayer/objective
@onready var back: Button = $CanvasLayer/back
@onready var audio: AudioStreamPlayer = $AudioStreamPlayer

@export var unlock_level:int

var is_holding_egg = false
var hold_time = 0
var game_over = false
var is_win = false


func _ready() -> void:
	egg.connect("stolen_signal", Callable(self, "_on_egg_stolen"))
	for enemy in get_tree().get_nodes_in_group("gai_bodyguard"):
		enemy.player_caught.connect(_on_player_caught)
	win.visible = false
	eggg.visible = false
	back.focus_mode = Control.FOCUS_NONE


func _process(delta: float) -> void:
	if is_holding_egg and not audio.playing:
		audio.play()
	if game_over and audio.playing:
		audio.stop()
	if is_win and audio.playing:
		audio.stop()
	
	if is_holding_egg and not game_over and not is_win: 
		eggg.visible = true
		hold_time += delta
	else:
		eggg.visible = false


func _on_area_2d_body_entered(body: Node2D) -> void:
		if is_holding_egg and body.is_in_group("player") and not game_over and not is_win:
			Global.unlock_level(unlock_level)
			GlobleSound.play_sound("res://asset/floraphonic-you-win-sequence-2-183949.mp3")
			win.visible = true
			is_win = true

func _on_go_back_pressed() -> void:
	$"CanvasLayer/go back".visible = false  
	is_holding_egg = false
	eggg.visible = false
	hold_time = 0.0   
	game_over = false    
	GlobleSound.play_sound("res://asset/btnSound.mp3")
	player.set_deferred("global_position", player_home.global_position)

func _on_egg_stolen() -> void:
	is_holding_egg = true
	hold_time = 0.0
	game_over = false

func _on_player_caught() -> void:
	game_over = true
	player.set_deferred("global_position", player_home.global_position)

func _on_back_pressed() -> void:
	GlobleSound.play_sound("res://asset/btnSound.mp3")
	get_tree().change_scene_to_file("res://scenes/level.tscn")
