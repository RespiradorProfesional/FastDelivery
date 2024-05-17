extends Node2D

@onready var score_items=$"Score Items"
@export var dialogue : String
@onready var playerFSM= $Player/FSM

# Called when the node enters the scene tree for the first time.
func _ready():
	AudioPlayerBackground.play_music_level1_background()
	Dialogic.signal_event.connect(start_level)
	GlobalVariable.isChatting=true
	run_dialogue(dialogue)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func run_dialogue(dialogue_string):
	Dialogic.start(dialogue_string)

func start_level(args: String):
	if args=="exit_dialogue_starts":
		score_items.start_time()
		GlobalVariable.isChatting=false
		print("EMPEZOOOOOOOO")



