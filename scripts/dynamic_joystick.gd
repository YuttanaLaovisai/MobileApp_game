extends CanvasLayer

@onready var joystick_container = $Container
@onready var joystick = $"Container/Virtual Joystick"

var active_touch_index: int = -1

func _ready():
	joystick_container.visible = false
	# Disable native input processing on the joystick so we can fully control its activation here
	joystick.set_process_input(false)

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		if event.pressed and active_touch_index == -1:
			active_touch_index = event.index
			
			# Calculate the exact center of the joystick's base relative to its container
			var base_center = joystick._base.position + (joystick._base.size / 2.0)
			# Offset the container so that the base center lands exactly on the touch position
			joystick_container.position = event.position - base_center
			joystick_container.visible = true
			
			# Visually press down the joystick tip and update its internal state immediately
			joystick._tip.modulate = joystick.pressed_color
			joystick._update_joystick(event.position)
			get_viewport().set_input_as_handled()
			
		elif not event.pressed and event.index == active_touch_index:
			active_touch_index = -1
			joystick._reset()
			joystick_container.visible = false
			get_viewport().set_input_as_handled()
			
	elif event is InputEventScreenDrag:
		if event.index == active_touch_index:
			# Pass drag natively to update the joystick continuously
			joystick._update_joystick(event.position)
			get_viewport().set_input_as_handled()
