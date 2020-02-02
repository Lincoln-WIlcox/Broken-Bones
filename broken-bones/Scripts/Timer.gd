extends ProgressBar


func _process(delta: float) -> void:
	var percentage = (Global.timer.time_left / Global.puzzle_time) * 100
	self.value = percentage
 
