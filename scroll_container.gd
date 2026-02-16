extends ScrollContainer

var dragging = false
var last_pos = 0

func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			dragging = event.pressed
			last_pos = event.position.x

	if event is InputEventMouseMotion and dragging:
		var delta = event.position.x - last_pos
		scroll_horizontal -= delta
		last_pos = event.position.x
