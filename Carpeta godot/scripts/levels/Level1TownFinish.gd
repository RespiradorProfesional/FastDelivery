extends Node2D

@onready var controlLevelCalification=$controlLevelCalification
var score

# Called when the node enters the scene tree for the first time.
func _ready():
	score = GlobalVariable.score
	Dialogic.signal_event.connect(managament_records)
	if score<=controlLevelCalification.recordGold:
		Dialogic.start("timelineLevel1recordGold")
	elif score<=controlLevelCalification.recordSilver:
		Dialogic.start("timelineLevel1recordSilver")
	elif score<=controlLevelCalification.recordBronze:
		Dialogic.start("timelineLevel1recordBronze")
	else :
		Dialogic.start("timelineLevel1GamerOver")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func managament_records(args: String):
	match args:
		"FinishLvl1Gold" :
			controlLevelCalification.start_GoldScreen(score)
		"FinishLvl1Silver" :
			controlLevelCalification.start_SilverScreen(score)
		"FinishLvl1Bronze" :
			controlLevelCalification.start_BronzeScreen(score)
		_:
			controlLevelCalification.start_GameOverScreen(score)
