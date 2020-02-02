extends Node

var dinosaurs = []

var timer: Timer
var puzzle_time := 10

#to make sure window is placed correctly on build
func _ready():
	OS.set_window_position(Vector2())
	
	timer = Timer.new()
	timer.connect("timeout",self,"_on_timer_timeout")
	timer.set_one_shot(true)
	add_child(timer)
	timer.start(puzzle_time)


func add_dinosaur(dinosaur):
	if dinosaurs.size() >= 3:
		dinosaurs.remove(0)
	dinosaurs.append(dinosaur)


func _on_timer_timeout():
	get_tree().change_scene("res://Scenes/Game Over Screen.tscn")
	
