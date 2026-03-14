extends SceneTree

func _init():
	var canvas = CanvasLayer.new()
	var container = Container.new()
	canvas.add_child(container)
	
	var joy = preload("res://addons/virtual_joystick/virtual_joystick_scene.tscn").instantiate()
	container.add_child(joy)
	
	var root = Window.new()
	root.add_child(canvas)
	
	container.position = Vector2(500, 500)
	
	# Force update
	call_deferred("_check", container, joy)

func _check(container, joy):
	print("Container global pos: ", container.global_position)
	print("Joy global pos: ", joy.global_position)
	print("Joy size: ", joy.size)
	print("Base global pos: ", joy._base.global_position)
	print("Base size: ", joy._base.size)
	quit()
