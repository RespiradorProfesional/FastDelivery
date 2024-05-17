extends Control

@export var recordBronze=0
@export var recordSilver=0
@export var recordGold=0

@onready var scoreLabel=$ScorePanel/ScoreLabel
@onready var scorePanel=$ScorePanel

func _ready():
	scorePanel.visible=false

# Called when the node enters the scene tree for the first time.
func start_GameOverScreen(time : int) : 
	scoreLabel.text=str(time)
	scorePanel.visible=true

func start_BronzeScreen(time : int) : 
	scoreLabel.text=str(time)
	scorePanel.visible=true

func start_SilverScreen(time : int) : 
	scoreLabel.text=str(time)
	scorePanel.visible=true

func start_GoldScreen(time : int) : 
	scoreLabel.text=str(time)
	scorePanel.visible=true

