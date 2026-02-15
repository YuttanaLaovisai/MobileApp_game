extends Node2D

@onready var marker: Marker2D = $"."
@export var cooldown: float = 3.0
@export var coin_scene: PackedScene

var timer: float = 0.0
var current_coin: Node = null   # เก็บเหรียญที่ spawn ล่าสุด


func _ready():
	await get_tree().process_frame
	spawn_coin()


func _process(delta: float) -> void:
	
	if current_coin != null:
		return

	timer += delta

	if timer >= cooldown:
		timer = 0.0
		spawn_coin()


func spawn_coin():
	if coin_scene == null:
		return
	
	current_coin = coin_scene.instantiate()
	current_coin.global_position = marker.global_position
	get_tree().current_scene.add_child(current_coin)

	current_coin.tree_exited.connect(_on_coin_removed)


func _on_coin_removed():
	current_coin = null
