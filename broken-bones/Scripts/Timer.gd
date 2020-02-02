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
	self.value = (timer.time_left / puzzle_time) * 100


func _on_timer_timeout():
	print('whoops')