extends Control

onready var dinospot1 = $"Margin/Pedastal Hbox/Pedastal 1 Vbox/Dinosaur1"
onready var dinospot2 = $"Margin/Pedastal Hbox/Pedastal 2 Vbox/Dinosaur2"
onready var dinospot3 = $"Margin/Pedastal Hbox/Pedastal 3 Vbox/Dinosaur3"
onready var dinospots = [
dinospot1,
dinospot2,
dinospot3
]

onready var margincontainers = [
$"Margin/Pedastal Hbox/Pedastal 1 Vbox/MarginContainer",
$"Margin/Pedastal Hbox/Pedastal 2 Vbox/MarginContainer2",
$"Margin/Pedastal Hbox/Pedastal 3 Vbox/MarginContainer3"
]

func _ready():
	
	for spotindex in range(dinospots.size()):
		dinospots[spotindex].position = margincontainers[spotindex].get_position()
	
	for dinosaur_index in range(Global.dinosaurs.size()):
		var dinosaur = Global.dinosaurs[dinosaur_index]
		print(dinosaur.get_parts()[0])
		for part in dinosaur.dinosaur_parts:
			dinospots[dinosaur_index].add_child(part)
