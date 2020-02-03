extends Control
export var next_scene: PackedScene

func _on_Submit_pressed():
	
	var dinosaur_parts = []
	
	for part in $"Dinosaur Parts".get_children():
		if part in $"Build Area".get_overlapping_areas():
			dinosaur_parts.append(part.duplicate())
	
	var smallestvector2 = dinosaur_parts[0].position if dinosaur_parts else null
	
	for part in dinosaur_parts:
		if part.position.x < smallestvector2.x:
			smallestvector2.x = part.position.x
		if part.position.y < smallestvector2.y:
			smallestvector2.y = part.position.y
	
	for part in dinosaur_parts:
		part.position -= smallestvector2
		
	
	Global.play_voiceline()
	
	Global.add_dinosaur(Dinosaur.new(dinosaur_parts,$"Margin/Main HBox/Middle VBox/HBoxContainer/Name".text))
	
	if Global.dinosaurs.size() == 3:
		get_tree().change_scene("res://Scenes/Trophy Room.tscn")
	elif next_scene:
		get_tree().change_scene_to(next_scene)
