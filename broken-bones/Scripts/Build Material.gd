extends Area2D

var lifted := false
var mouse_pos: Vector2
export var selection_variance := Vector2(20, 20)

func _process(delta: float) -> void:
	mouse_pos = get_viewport().get_mouse_position()
	if lifted:
		position = mouse_pos
		set_scale(Vector2(.55, .55))
	else:
		set_scale(Vector2(.5, .5))

func _input(event):
   # Mouse in viewport coordinates
	if event and event is InputEventMouseButton and event.pressed:
		if match_mouse_pos():
			lifted = !lifted


func match_mouse_pos():
	return mouse_pos.x > self.position.x - selection_variance.x  and mouse_pos.x < self.position.x + selection_variance.x and mouse_pos.y > self.position.y - selection_variance.y and mouse_pos.y < self.position.y + selection_variance.y
