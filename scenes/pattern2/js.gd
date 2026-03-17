extends Area2D

var chick = preload("res://scenes/gai_bodyguard.tscn")
@onready var audio: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _ready() -> void:
	call_deferred("_check_overlapping")

func _check_overlapping() -> void:
	# Await one physics frame to ensure the Area2D has been added to the physics server constraints
	await get_tree().physics_frame
	
	for body in get_overlapping_bodies():
		if body.is_in_group("player"):
			_on_body_entered(body)
			break

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		var ene = chick.instantiate()
		add_child(ene)
		await get_tree().create_timer(0.1).timeout
		ene.queue_free()
