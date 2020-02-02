extends Node

#This is the class that dinosaurs save in.

class_name Dinosaur

var dinosaur_parts: Array
var dino_name: String

func _init(_dinosaur_parts, _dino_name):
	dinosaur_parts = _dinosaur_parts
	dino_name = _dino_name

func get_parts():
	return dinosaur_parts
