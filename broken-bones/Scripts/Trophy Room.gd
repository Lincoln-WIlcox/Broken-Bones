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

onready var labels = [
$"Margin/Pedastal Hbox/Pedastal 1 Vbox/MarginContainer4/Hbox2/MarginContainer3/Label",
$"Margin/Pedastal Hbox/Pedastal 2 Vbox/MarginContainer3/Hbox2/MarginContainer3/Label",
$"Margin/Pedastal Hbox/Pedastal 3 Vbox/MarginContainer4/Hbox3/MarginContainer3/Label"
]

func _ready():
	Global.timer.stop()



	if rand_range(0,2) > 1:
		$"Space Background".visible = false

	for spotindex in range(dinospots.size()):
		dinospots[spotindex].position = margincontainers[spotindex].get_position()

	for dinosaur_index in range(Global.dinosaurs.size()):
		var dinosaur = Global.dinosaurs[dinosaur_index]
		labels[dinosaur_index].text = dinosaur.dino_name
		for part in dinosaur.dinosaur_parts:
			dinospots[dinosaur_index].add_child(part)


func _on_Button_pressed() -> void:
	Global.dinosaurs.clear()
	Global.start_game()
