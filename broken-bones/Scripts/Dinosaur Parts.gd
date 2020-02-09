extends Node2D

export var random_parts_amount: int

func _ready():
	for i in range(random_parts_amount):
		var part = Global.build_materials[rand_range(0,Global.build_materials.size())]
		var randomposition = Vector2(rand_range(1500, 1830),rand_range(10,1000))
		part = load(part).instance()
		part.position = randomposition
		add_child(part) 
