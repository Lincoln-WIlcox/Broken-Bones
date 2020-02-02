extends Node

#This is the class that dinosaurs save in.

class_name Dinosaur

var dinosaur_parts = []

func _init(_dinosaur_parts):
	dinosaur_parts = _dinosaur_parts

func get_parts():
	return dinosaur_parts
