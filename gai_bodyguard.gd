extends Node2D

signal player_caught
@onready var audio: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	audio.play()
	anim.play("run")





func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("don")
		emit_signal("player_caught")
