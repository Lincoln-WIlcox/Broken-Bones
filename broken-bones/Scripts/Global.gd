extends Node

const VOICE_LINE_PATH = "res://Assets/Sound/Voice Lines/Submission/"
const GARBAGE_MATERIAL_PATH = "res://Scenes/Build Materials/Garbage/"
const DINO_MATERIAL_PATH = "res://Scenes/Build Materials/Dinos/"

var dinosaurs = []

onready var garbage_materials = get_files(GARBAGE_MATERIAL_PATH)
onready var dino_bones = get_files(DINO_MATERIAL_PATH)
onready var build_materials = garbage_materials + dino_bones
onready var voicelines = get_voice_audio_files()

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


func play_voiceline():
	Music.get_node("Dino-Mite").stream = load(voicelines[rand_range(0,voicelines.size())])
	Music.get_node("Dino-Mite").play()


func start_game():
	get_tree().change_scene("res://Scenes/Levels/TRex Level.tscn")
	timer.start(puzzle_time)


func get_voice_audio_files() -> Array:
	# gets all files in the voice lines folder and filter out non audio files

	var voice_line_files = get_files(VOICE_LINE_PATH)
	var voice_audio_files = []

	for file in voice_line_files:
		# we have to do this due to https://github.com/godotengine/godot/issues/18390
		if file.get_extension() == "import":
			voice_audio_files.append(file.replace(".import", ""))

	return voice_audio_files


func get_files(root_path: String) -> Array:
	var files = []
	var dir = Directory.new()

	if dir.open(root_path) == OK:
		dir.list_dir_begin(true, false)

		var file_name = dir.get_next()

		while (file_name != ""):
			var path = dir.get_current_dir() + "/" + file_name

			if dir.current_is_dir():
				files = files + get_files(path)
			else:
				files.append(path)

			file_name = dir.get_next()

	return files
