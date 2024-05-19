extends Node2D
class_name Level_Template

#Esta escena es usada como base para todas las escenas, aqui se gestiona
#el uso del score y se realiza el dialogo del principio del nivel, segun el nombre
#del dialogo pasado en la variable "dialogue"

@onready var score_items=$"Score Items"
@export var dialogue : String
@onready var playerFSM= $Player/FSM


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



