extends Area2D

var lifted = false

func _process(delta):
	if lifted:
		self.position = get_viewport().get_mouse_position()

func _input(event):
   # Mouse in viewport coordinates
	if event is InputEventMouseButton and event.pressed and event:
		lifted = !lifted
		print(event.as_text())
