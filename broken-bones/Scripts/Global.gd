extends Node

var dinosaurs = []

#to make sure window is placed correctly on build
func _ready():
	OS.set_window_position(Vector2())


func add_dinosaur(dinosaur):
	if dinosaurs.size() >= 3:
		dinosaurs.remove(0)
	dinosaurs.append(dinosaur)
	
