extends Control

@export var skin_name := "default"
@export var skin_path := "res://skins/default.tres"
@export var price := 100
#@export var button: Button

@onready var button: Button = $Button


func _ready():
	update_button()
	button.focus_mode = Control.FOCUS_NONE
	GlobalSkin.skin_changed.connect(update_button)


func _on_button_pressed() -> void:
	GlobleSound.play_sound("res://asset/btnSound.mp3")
	print("a")

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

	update_button()

func update_button():
	if GlobalSkin.current_skin == skin_path:
		button.text = "Used"
		button.disabled = true

	elif GlobalSkin.unlocked_skins.get(skin_name, false):

		button.text = "Use"
		button.disabled = false

	else:
		button.text = "Unlock (" + str(price) + ")"
		button.disabled = false
