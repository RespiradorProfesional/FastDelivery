extends Node2D

@onready var controlLevelCalification=$controlLevelCalification
var score

#Al inicializarse genera el dialogo final del nivel, genera uno u otro dependiendo
#de las variables recordGold,recordSilver,recordBronze y del tiempo realizado por el
#jugador en el nivel 

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
		Dialogic.start("timelineLevel1GameOver")

#Dependiendo de la respuesta del dialogo previamente generado, muestra una pantalla
#de records u otra

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
