extends Area2D

var mouse_over = false

func _on_Build_Material_mouse_entered():
	mouse_over = true
	print("mousing over")

func _on_Build_Material_mouse_exited():
	mouse_over = false

func _process(delta):
	print(mouse_over)
