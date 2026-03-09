extends Node2D

@onready var player: RigidBody2D = $player
@onready var player_home: Marker2D = $playerHome
@onready var chicken: CharacterBody2D = $chicken
@onready var egg = $egg
@onready var win: Control = $CanvasLayer/win_interface/CanvasLayer/win
@onready var eggg = $player/egg
@onready var objective: Label = $CanvasLayer/objective
@onready var go_back: Button = $"CanvasLayer/go back"
@onready var back: Button = $CanvasLayer/back

@export var unlock_level:int
@export var minimum_time:float

var is_holding_egg = false
var hold_time = 0
var game_over = false
var is_win = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	objective.text = "Objective : Holding egg for 0/"+str(int(minimum_time))+"s  and run back home."
	egg.connect("stolen_signal", Callable(self, "_on_egg_stolen"))
	chicken.connect("player_caught", Callable(self, "_on_player_caught"))  
	chicken.target = player
	win.visible = false
	eggg.visible = false
	go_back.visible = false
	go_back.focus_mode = Control.FOCUS_NONE
	back.focus_mode = Control.FOCUS_NONE


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_holding_egg and not game_over and not is_win: 
		eggg.visible = true
		hold_time += delta
		var s = "%.2f" % hold_time
		objective.text = "Objective : Holding egg for "+str(s)+"/"+str(minimum_time)+"s  and run back home."
	else:
		eggg.visible = false
	if game_over: 
		go_back.visible = true


func _on_area_2d_body_entered(body: Node2D) -> void:
		if is_holding_egg and body.is_in_group("player") and hold_time > minimum_time and not is_win:
			chicken.chase = false
			chicken.player.stop()
			Global.unlock_level(unlock_level)
			GlobleSound.play_sound("res://asset/floraphonic-you-win-sequence-2-183949.mp3")
			win.visible = true
			is_win = true
			go_back.visible = false
			

func _on_go_back_pressed() -> void:
	$"CanvasLayer/go back".visible = false  
	is_holding_egg = false
	eggg.visible = false
	chicken.chase = false 
	hold_time = 0.0   
	game_over = false    
	GlobleSound.play_sound("res://asset/btnSound.mp3")
	player.set_deferred("global_position", player_home.global_position)

func _on_egg_stolen() -> void:
	is_holding_egg = true
	hold_time = 0.0
	chicken.chase = true
	game_over = false

func _on_player_caught() -> void:
	if not is_holding_egg:
		return
	game_over = true

func _on_back_pressed() -> void:
	GlobleSound.play_sound("res://asset/btnSound.mp3")
	get_tree().change_scene_to_file("res://scenes/level.tscn")
