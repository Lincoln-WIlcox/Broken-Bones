extends Node

var dinosaurs = []

func add_dinosaur(dinosaur):
	if dinosaurs.size() >= 3:
		dinosaurs.remove(0)
	dinosaurs.append(dinosaur)
	print(dinosaurs)
