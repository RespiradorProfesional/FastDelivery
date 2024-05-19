extends Control

#Esta escena puede ser utilizado para todas las escenas, en las cuales se usen para
#mostrar la puntuacion final del jugador en cada nivel

@export var recordBronze=0
@export var recordSilver=0
@export var recordGold=0

#Esta variable se usa para que al terminar el timer esta variable pase a true,
#y se pueda realizar una acción seguidamente 

var timerFinish=false

@onready var scoreLabel=$ScorePanel/ScoreLabel
@onready var recordLabel=$ScorePanel/RecordLabel
@onready var scorePanel=$ScorePanel
@onready var recordImage=$ScorePanel/RecordImage
@onready var startButton=$ScorePanel/Startbutton
@onready var timer=$Timer
@onready var bronzeImage=preload("res://Ui elements/Final level menu/Bronze.png")
@onready var silverImage=preload("res://Ui elements/Final level menu/Silver.png")
@onready var goldImage=preload("res://Ui elements/Final level menu/Gold.png")

func _ready():
	scorePanel.visible=false
	

#Detecta cualquier accion del jugador, y si timerFinish es true puedes pulsar cualquier
#tecla para volver al menu principal

func _input(event):
	if timerFinish:
		if event is InputEventKey:
				var key_event = event as InputEventKey
				if key_event.pressed:
					GlobalVariable.score=0
					get_tree().change_scene_to_file("res://scenes/Ui/MainMenu.tscn")


# los metodos que empiezan con "start_" se usan para mostrar la calificacion del jugador
#segun el tiempo pasado por parametro, dependiendo del metodo muestra una insignia u otra

func start_GameOverScreen(time : int) : 
	scoreLabel.text=GlobalVariable.formatTime(time)
	recordLabel.text="No pasaste el nivel"
	scorePanel.visible=true
	

func start_BronzeScreen(time : int) : 
	recordImage.texture=bronzeImage
	scoreLabel.text=GlobalVariable.formatTime(time)
	recordLabel.text="Bronce"
	scorePanel.visible=true
	start_timer()

func start_SilverScreen(time : int) : 
	recordImage.texture=silverImage
	scoreLabel.text=GlobalVariable.formatTime(time)
	recordLabel.text="Plata"
	scorePanel.visible=true
	start_timer()

func start_GoldScreen(time : int) : 
	recordImage.texture=goldImage
	scoreLabel.text=GlobalVariable.formatTime(time)
	recordLabel.text="Oro"
	scorePanel.visible=true
	start_timer()

func start_timer():
	timer.start()

func _on_timer_timeout():
	timerFinish=true
	startButton.visible=true
