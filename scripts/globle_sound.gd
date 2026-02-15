extends Node

@onready var player: AudioStreamPlayer = AudioStreamPlayer.new()


func _ready():
	add_child(player)


func play_sound(path: String):

	var stream: AudioStream = load(path)

	if stream is AudioStreamWAV:
		stream.loop_mode = AudioStreamWAV.LOOP_DISABLED

	player.stream = stream
	player.play()



func play_loop(path: String):

	var stream: AudioStream = load(path)

	if stream is AudioStreamWAV:
		stream.loop_mode = AudioStreamWAV.LOOP_FORWARD

	elif stream is AudioStreamOggVorbis:
		stream.loop = true

	player.stream = stream
	player.play()



func stop():
	player.stop()
