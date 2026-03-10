extends Node2D

signal hit

var last_position:Vector2
@onready var anim: AnimationPlayer = $AnimationPlayer
@onready var audio: AudioStreamPlayer2D = $Audio1
@onready var audio2: AudioStreamPlayer2D = $Audio2


func _process(delta: float) -> void:
	if global_position != last_position:
		anim.play("spinning_gai")
		if not audio.playing:
			audio.play()
			audio2.stop()
	else:
		anim.play("idle")
		if not audio2.playing:
			audio2.play()
			audio.stop()
	last_position = global_position


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		emit_signal("hit")
