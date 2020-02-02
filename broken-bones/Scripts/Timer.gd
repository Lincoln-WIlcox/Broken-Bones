extends ProgressBar

var timer: Timer
export var puzzle_time: int

func _ready() -> void:
	timer = Timer.new()
	timer.connect("timeout",self,"_on_timer_timeout")
	timer.set_one_shot(true)
	add_child(timer)
	timer.start(puzzle_time)
	
	
func _process(delta: float) -> void:
	var percentage = (timer.time_left / puzzle_time) * 100
	self.value = percentage


func _on_timer_timeout():
	get_tree().change_scene("res://Scenes/Game Over Screen.tscn")
