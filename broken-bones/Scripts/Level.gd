extends Control


func _on_Submit_pressed():
	
	var dinosaur_parts = []
	
	for part in $"Dinosaur Parts".get_children():
		dinosaur_parts.append(part.duplicate())
	
	Global.add_dinosaur(Dinosaur.new(dinosaur_parts))
