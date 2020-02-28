extends Area2D

var lifted := false
var mouse_pos: Vector2
export var selection_variance := Vector2(20, 20)
onready var current_scale = get_scale()

func _process(delta: float) -> void:
	handle_item_update()
	handle_moving()


func _input(event):
	# Mouse in viewport coordinates
	if event and event is InputEventMouseButton and event.pressed:
		if match_mouse_pos():
			lifted = !lifted


func handle_item_update() -> void:
	if lifted:
		update_rotation()
		update_z_index()
		update_scale()
		update_h_flip()


func update_rotation() -> void:
	# based on Input we'll return rotation degrees needed to change
	set_rotation_degrees(rotation_degrees + (Input.get_action_strength("Rotate Right") - Input.get_action_strength("Rotate Left")) * 5)


func update_z_index() -> void:
	if Input.is_action_just_pressed("Push Foreground"):
		set_z_index(clamp(z_index - 1, 1, 100))
	if Input.is_action_just_pressed("Push Background"):
		set_z_index(clamp(z_index + 1, 1, 100))


func update_scale() -> void:
	var scale_direction = (Input.get_action_strength("Scale Up") - Input.get_action_strength("Scale Down")) / 50
	current_scale += Vector2(scale_direction, scale_direction)


func update_h_flip() -> void:
	if Input.is_action_just_pressed("Flip"):
		var sprite = get_node("Sprite")
		sprite.set_flip_h(!sprite.flip_h)


func handle_moving() -> void:
	mouse_pos = get_viewport().get_mouse_position()

	if lifted:
		position = mouse_pos
		set_scale(current_scale + Vector2(.05, .05))
	else:
		set_scale(current_scale)


func match_mouse_pos():
	return mouse_pos.x > self.position.x - selection_variance.x  and mouse_pos.x < self.position.x + selection_variance.x and mouse_pos.y > self.position.y - selection_variance.y and mouse_pos.y < self.position.y + selection_variance.y
