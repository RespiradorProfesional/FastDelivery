extends Node

var urlBaseApi= "http://127.0.0.1:5000"

var blend_pos_paths = [
	"parameters/Idle/blend_position",
	"parameters/Jump/blend_position",
	"parameters/Running/blend_position",
	"parameters/Jump/blend_position",
	"parameters/Fall/blend_position",
	"parameters/Bend/blend_position",
	"parameters/InWall/blend_position",
	"parameters/WallJump/blend_position",
	"parameters/Slide/blend_position",
	"parameters/BendJump/blend_position"
]

var score=0
var isChatting=true
var userId=0
var userName=""
var userPassw=""

func formatTime(seconds):
	var tiempoFormateado=""
	# Suponiendo que "segundosTotales" es el tiempo total en segundos
	var minutos = seconds / 60
	var segundos = seconds % 60
	# Formatear los minutos y segundos en una cadena
	if segundos < 10:
		tiempoFormateado = str(minutos) + ":0" + str(segundos)
		return tiempoFormateado
	else : 
		tiempoFormateado = str(minutos) + ":" + str(segundos)
		return tiempoFormateado
