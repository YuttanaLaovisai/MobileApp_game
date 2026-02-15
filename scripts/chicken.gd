extends CharacterBody2D

signal player_caught 

@export var speed: float = 200
@onready var agent: NavigationAgent2D = $NavigationAgent2D

var target: Node2D = null
var chase: bool = false
var home_position: Vector2

func _ready():
	add_child(player)
	home_position = global_position
	$AnimatedSprite2D.play("idle")
	if not $idlesound.playing:
		$idlesound.play()

func _physics_process(delta: float) -> void:
	if not chase:
		GlobalCurrency.can_collect = false
	else:
		GlobalCurrency.can_collect = true
	if not $idlesound.playing and not chase:
		$idlesound.play()
	if chase and target:
		agent.target_position = target.global_position
		
		if not $AudioStreamPlayer2D.playing:
			$AudioStreamPlayer2D.play()
			$idlesound.stop()
	else:
		agent.target_position = home_position
		if $AudioStreamPlayer2D.playing:
			$AudioStreamPlayer2D.stop()
		if not $idlesound.playing:
			$idlesound.play()
		global_position = home_position

	if agent.is_navigation_finished():
		velocity = Vector2.ZERO
		if $AnimatedSprite2D.animation != "idle":
			$AnimatedSprite2D.animation = "idle"
			$AnimatedSprite2D.play()
	else:
		var dir = (agent.get_next_path_position() - global_position).normalized()
		velocity = dir * speed
		move_and_slide()

		if dir != Vector2.ZERO:
			if $AnimatedSprite2D.animation != "run":
				$AnimatedSprite2D.animation = "run"
				$AnimatedSprite2D.play()
				play_loop("res://asset/SUBWAY SURFERS (Main Theme).mp3")
				
			$AnimatedSprite2D.flip_h = dir.x < 0
		else:
			if $AnimatedSprite2D.animation != "idle":
				$AnimatedSprite2D.animation = "idle"
				$AnimatedSprite2D.play()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		chase = false
		print(speed)
		player.stop()
		emit_signal("player_caught")
		if chase:
			GlobleSound.play_sound("res://asset/freesound_community-negative_beeps-6008.mp3")

@onready var player: AudioStreamPlayer = AudioStreamPlayer.new()

func play_loop(path: String):

	var stream: AudioStream = load(path)

	if stream is AudioStreamWAV:
		stream.loop_mode = AudioStreamWAV.LOOP_FORWARD

	elif stream is AudioStreamOggVorbis:
		stream.loop = true

	player.stream = stream
	player.play()
