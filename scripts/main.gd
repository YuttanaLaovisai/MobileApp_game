extends Node2D

@onready var player = $player
@onready var chicken = $chicken
@onready var egg = $egg
@onready var time_label = $CanvasLayer/Label
@onready var highesttime_label = $CanvasLayer/Label2
@onready var eggg = $player/egg
@onready var coin: Label = $CanvasLayer/coin

var is_holding_egg := false
var highest_time := 0.0
var hold_time := 0.0
var game_over := false 
var exit_area = false
var bonus_time := 0


func _ready():
	Global.reset()
	for point in get_tree().get_nodes_in_group("point"):
		point.connect("point_collected", Callable(self, "_on_point_collected"))
	$CanvasLayer/back.focus_mode = Control.FOCUS_NONE
	$"CanvasLayer/go back".focus_mode = Control.FOCUS_NONE

	# connect signal
	egg.connect("stolen_signal", Callable(self, "_on_egg_stolen"))
	chicken.connect("player_caught", Callable(self, "_on_player_caught"))  

	chicken.target = player

	# โหลด highest score จาก Global
	highest_time = Global.hightest_score

	var s = "%.2f" % highest_time
	highesttime_label.text = "High score : " + str(s)

func _on_point_collected():
	bonus_time += 5
	var s = "%.2f" % (hold_time+bonus_time)
	time_label.text = "Holding Egg : " + str(s)
	print("a")


func _process(delta: float) -> void:
	coin.text = "Coin : " + str(GlobalCurrency.coin)

	# แสดงไข่บน player
	if eggg:
		eggg.visible = is_holding_egg and not game_over

	# จับเวลา
	if is_holding_egg and not game_over:
		
		hold_time += delta

		var s = "%.2f" % hold_time
		time_label.text = "Holding Egg : " + str(s)


	# แสดงปุ่ม go back
	if exit_area and game_over:
		$"CanvasLayer/go back".visible = true
	else:
		$"CanvasLayer/go back".visible = false



func _on_egg_stolen() -> void:

	is_holding_egg = true
	hold_time = 0.0
	game_over = false

	chicken.chase = true

	time_label.text = "Holding Egg : 0.00"


func _on_player_caught() -> void:

	game_over = true

	if hold_time > highest_time:

		highest_time = hold_time

		var s = "%.2f" % highest_time
		highesttime_label.text = "High score : " + str(s)

		Global.save_hightest(highest_time)



func _on_back_pressed() -> void:

	GlobleSound.play_sound("res://asset/btnSound.mp3")

	get_tree().change_scene_to_file("res://scenes/start.tscn")



func _on_area_2d_body_exited(body: Node2D) -> void:

	if body.is_in_group("player"):
		exit_area = true



func _on_area_2d_body_entered(body: Node2D) -> void:

	if body.is_in_group("player"):
		exit_area = false



func _on_go_back_pressed() -> void:

	GlobleSound.play_sound("res://asset/btnSound.mp3")

	$player.set_deferred("global_position", $playerHome.global_position)
