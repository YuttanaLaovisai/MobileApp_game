extends RigidBody2D

@export var speed := 1000
var dir := Vector2.ZERO

@onready var joystick = $"CanvasLayer/Virtual Joystick"
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var footstep_sound: AudioStreamPlayer2D = $AudioStreamPlayer2D


func _ready() -> void:
	set_physics_process(false)   # ปิดก่อน

	GlobalSkin.load_skin()
	apply_skin()

	set_physics_process(true)    # เปิดหลังโหลดเสร็จ

func apply_skin():
	var frames: SpriteFrames = load(GlobalSkin.current_skin)

	if frames == null:
		print("โหลด skin ไม่สำเร็จ")
		return

	sprite.sprite_frames = frames

	print("โหลด skin:", GlobalSkin.current_skin)
	print("animations:", frames.get_animation_names())

	sprite.play("idle")



func _physics_process(delta):

	dir = joystick.get_direction()

	# Keyboard support
	if Input.is_action_pressed("w") or Input.is_action_pressed("up"):
		dir.y -= 1
	if Input.is_action_pressed("s") or Input.is_action_pressed("down"):
		dir.y += 1
	if Input.is_action_pressed("a") or Input.is_action_pressed("left"):
		dir.x -= 1
	if Input.is_action_pressed("d") or Input.is_action_pressed("right"):
		dir.x += 1

	if dir != Vector2.ZERO:
		dir = dir.normalized()

		# เล่นเสียงเดิน
		if not footstep_sound.playing:
			footstep_sound.play()

		# เลือก animation
		if dir.y < 0:
			if sprite.animation != "up":
				sprite.play("up")
		else:
			if sprite.animation != "down":
				sprite.play("down")

		sprite.flip_h = dir.x < 0

	else:
		if sprite.animation != "idle":
			sprite.play("idle")

		if footstep_sound.playing:
			footstep_sound.stop()

	linear_velocity = dir * speed
