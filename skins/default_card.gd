extends Control

@export var skin_name := "default"
@export var skin_path := "res://skins/default.tres"
@export var price := 100
@export var isSpacial:bool = false
#@export var button: Button
@onready var texture_rect: TextureRect = $TextureRect

@onready var button: Button = $Button


func _ready():
	update_button()
	button.focus_mode = Control.FOCUS_NONE
	GlobalSkin.skin_changed.connect(update_button)


func _on_button_pressed() -> void:
	GlobleSound.play_sound("res://asset/btnSound.mp3")
	print("a")
	if not isSpacial:
		if GlobalSkin.unlocked_skins[skin_name]:
			GlobalSkin.set_skin(skin_path)

		else:
			# เช็คเงินจาก GlobalCurrency
			if GlobalCurrency.coin >= price:
				GlobleSound.play_sound("res://asset/spinning_coin/freesound_crunchpixstudio-drop-coin-384921.mp3")
				GlobalCurrency.coin -= price
				GlobalCurrency.save_coin()
				GlobalSkin.unlock_skin(skin_name)
				GlobalSkin.set_skin(skin_path)
			else:
				GlobleSound.play_sound("res://asset/universfield-error-08-206492.mp3")
	else:
		if GlobalSkin.unlocked_skins[skin_name]:
			GlobalSkin.set_skin(skin_path)

		else:
			if Global.hightest_score > 10:
				GlobalSkin.unlock_skin(skin_name)
				GlobalSkin.set_skin(skin_path)
			else:
				GlobleSound.play_sound("res://asset/universfield-error-08-206492.mp3")
			
	update_button()

var hue := 0.0

func _process(delta):
	if isSpacial:
		hue += delta * 0.1   # ปรับความเร็วตรงนี้
		if hue > 1.0:
			hue = 0.0
		
		texture_rect.modulate = Color.from_hsv(hue, 1.0, 1.0)
	else:
		texture_rect.modulate = Color(1, 1, 1)

func update_button():
	if isSpacial:
		if GlobalSkin.current_skin == skin_path:
			button.text = "Used"
			button.disabled = true

		elif GlobalSkin.unlocked_skins.get(skin_name, false):

			button.text = "Use"
			button.disabled = false

		else:
			button.text = "Hold time 120s"
			button.disabled = false
	else :
		if GlobalSkin.current_skin == skin_path:
			button.text = "Used"
			button.disabled = true

		elif GlobalSkin.unlocked_skins.get(skin_name, false):

			button.text = "Use"
			button.disabled = false

		else:
			button.text = "Unlock (" + str(price) + ")"
			button.disabled = false
