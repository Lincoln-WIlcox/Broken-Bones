extends Node

var dinosaurs = []

var build_materials = [
"res://Scenes/Build Materials/Garbage/8 Ball.tscn",
"res://Scenes/Build Materials/Garbage/Beer Bottle.tscn",
"res://Scenes/Build Materials/Garbage/Googly Eye.tscn",
"res://Scenes/Build Materials/Garbage/Nameplate.tscn",
"res://Scenes/Build Materials/Garbage/Propeller.tscn",
"res://Scenes/Build Materials/Garbage/Scissors.tscn",
"res://Scenes/Build Materials/Garbage/Stapler Remover.tscn",
"res://Scenes/Build Materials/Garbage/Toiler Paper.tscn",
"res://Scenes/Build Materials/Mosasaurus/Spiny Arms.tscn",
"res://Scenes/Build Materials/Mosasaurus/Spiny Head.tscn",
"res://Scenes/Build Materials/Mosasaurus/Spiny Legs.tscn",
"res://Scenes/Build Materials/Mosasaurus/Spiny Neck.tscn",
"res://Scenes/Build Materials/Mosasaurus/Spiny Ribs.tscn",
"res://Scenes/Build Materials/Mosasaurus/Spiny Tail.tscn",
"res://Scenes/Build Materials/Seabuddy/Seabuddy Arms.tscn",
"res://Scenes/Build Materials/Seabuddy/Seabuddy Head.tscn",
"res://Scenes/Build Materials/Seabuddy/Seabuddy Legs.tscn",
"res://Scenes/Build Materials/Seabuddy/Seabuddy Neck.tscn",
"res://Scenes/Build Materials/Seabuddy/Seabuddy Ribs.tscn",
"res://Scenes/Build Materials/Seabuddy/Seabuddy Tail.tscn",
"res://Scenes/Build Materials/Trex/Trex Arms.tscn",
"res://Scenes/Build Materials/Trex/Trex Head.tscn",
"res://Scenes/Build Materials/Trex/Trex Legs.tscn",
"res://Scenes/Build Materials/Trex/Trex Neck.tscn",
"res://Scenes/Build Materials/Trex/Trex Ribs.tscn",
"res://Scenes/Build Materials/Trex/Trex Tail.tscn",
"res://Scenes/Build Materials/Garbage/3D Glasses.tscn",
"res://Scenes/Build Materials/Garbage/Alien.tscn",
"res://Scenes/Build Materials/Garbage/Dragonball.tscn",
"res://Scenes/Build Materials/Garbage/Robot Arm.tscn",
"res://Scenes/Build Materials/Garbage/Swordfish.tscn",
"res://Scenes/Build Materials/Garbage/ok.tscn",
"res://Scenes/Build Materials/Garbage/Lightsaber.tscn",
]

var timer: Timer
var puzzle_time := 80

#to make sure window is placed correctly on build
func _ready():
	randomize()
	
	timer = Timer.new()
	timer.connect("timeout",self,"_on_timer_timeout")
	timer.set_one_shot(true)
	add_child(timer)
	
	OS.set_window_position(Vector2())
	


func add_dinosaur(dinosaur):
	if dinosaurs.size() >= 3:
		dinosaurs.remove(0)
	dinosaurs.append(dinosaur)

func _on_timer_timeout():
	get_tree().change_scene("res://Scenes/Game Over Screen.tscn")
	

func start_game():
	get_tree().change_scene("res://Scenes/Levels/TRex Level.tscn")
	timer.start(puzzle_time)
