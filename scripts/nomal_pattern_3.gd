extends Node2D

@onready var player: RigidBody2D = $player
@onready var player_home: Marker2D = $playerHome
@onready var win: Control = $CanvasLayer/win_interface/CanvasLayer/win
@onready var eggg = $player/egg
@onready var objective: Label = $CanvasLayer/objective
@onready var back: Button = $CanvasLayer/back
@onready var audio: AudioStreamPlayer = $AudioStreamPlayer
@onready var gai_sniper: Node2D = $gai_sniper
@onready var night: ColorRect = $CanvasLayer/night
@onready var gai_home: Marker2D = $gai_home

@export var unlock_level:int
@export var speed: float = 5000
var game_over = false
var is_win = false

var is_day = true

func _ready() -> void:
	gai_sniper.connect("hit",Callable(self, "on_hit"))
	win.visible = false
	eggg.visible = false
	back.focus_mode = Control.FOCUS_NONE
	night.visible = false
	start_cycle()


func _process(delta: float) -> void:
	if player.linear_velocity.length() > 0 and not is_day:
		poong()

func _on_area_2d_body_entered(body: Node2D) -> void:
		if body.is_in_group("player") and not game_over and not is_win:
			Global.unlock_level(unlock_level)
			GlobleSound.play_sound("res://asset/floraphonic-you-win-sequence-2-183949.mp3")
			win.visible = true
			is_win = true

func poong():
	var target = player.global_position
	gai_sniper.global_position = gai_sniper.global_position.move_toward(target, speed * get_process_delta_time())

func on_hit():
	_on_player_caught()

func _on_player_caught() -> void:
	game_over = true
	player.set_deferred("global_position", player_home.global_position)
	gai_sniper.set_deferred("global_position", gai_home.global_position)

func _on_back_pressed() -> void:
	GlobleSound.play_sound("res://asset/btnSound.mp3")
	get_tree().change_scene_to_file("res://scenes/level.tscn")

func start_cycle():
	while true:
		var time = randf_range(3,5)
		await get_tree().create_timer(time).timeout
		toggle_day_night()

func toggle_day_night():
	is_day = not is_day
	
	if is_day:
		night.visible = false
	else:
		night.visible = true
