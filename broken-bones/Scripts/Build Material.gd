extends Area2D

var lifted = false
var mouse_pos

func _process(delta):
	mouse_pos = get_viewport().get_mouse_position()
	if lifted:
		self.position = mouse_pos

func _input(event):
   # Mouse in viewport coordinates
	if event is InputEventMouseButton and event.pressed and event:
		if match_mouse_pos():
			lifted = !lifted


func match_mouse_pos():
	return mouse_pos.x > self.position.x - 20  and mouse_pos.x < self.position.x + 20 and mouse_pos.y > self.position.y - 20 and mouse_pos.y < self.position.y + 20
