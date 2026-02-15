extends Area2D
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var sound: AudioStreamPlayer2D = $sound
@export var value:int

func _process(delta: float) -> void:
	if !anim.is_playing():
		anim.play()

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and GlobalCurrency.can_collect:
		GlobleSound.play_sound("res://asset/spinning_coin/freesound_crunchpixstudio-drop-coin-384921.mp3")
		GlobalCurrency.add_coin(value)
		print(GlobalCurrency.coin)
		queue_free()
