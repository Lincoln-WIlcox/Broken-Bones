extends ProgressBar

var timer

func _ready() -> void:
	timer = Timer.new()
	timer.connect("timeout",self,"_on_timer_timeout") 
	#timeout is what says in docs, in signals
	#self is who respond to the callback
	#_on_timer_timeout is the callback, can have any name
	add_child(timer) #to process
	timer.start(10) #to start
	
	
func _process(delta: float) -> void:s


func _on_timer_timeout():
	print('whoops')