extends Node2D

@onready var timer=$Timer
var seconds
@onready var cronometre=$CanvasLayer/Label
@onready var finalLevel=$finalLevel
var tiempoFormateado
# Called when the node enters the scene tree for the first time.
func _ready():
	tiempoFormateado= "0:00"
	seconds=0

func _on_timer_timeout():
	seconds+=1
	# Suponiendo que "segundosTotales" es el tiempo total en segundos
	var minutos = seconds / 60
	var segundos = seconds % 60
	# Formatear los minutos y segundos en una cadena
	if segundos < 10:
		tiempoFormateado = str(minutos) + ": 0" + str(segundos)
		cronometre.text=tiempoFormateado
	else : 
		tiempoFormateado = str(minutos) + ":" + str(segundos)
		cronometre.text=tiempoFormateado
	cronometre.text=tiempoFormateado



func _on_final_level_body_entered(body):
	seconds=0
