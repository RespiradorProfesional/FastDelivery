extends Node2D

@onready var timer=$Timer
@export var ruteScene=""
@export var actualLevel_id=0
var seconds
@onready var cronometre=$CanvasLayer/Label
@onready var finalLevel=$finalLevel
@onready var httpdRequest=$HTTPRequest

var tiempoFormateado
# Called when the node enters the scene tree for the first time.
func _ready():
	tiempoFormateado= "0:00"
	seconds=0
	cronometre.text=tiempoFormateado

func start_time():
	timer.start()

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
	var newScene = load(ruteScene)
	var json = JSON.stringify({"user_id":GlobalVariable.userId,"level_id":actualLevel_id,"time":seconds})
	
	var headers = ["Content-Type: application/json"]
	httpdRequest.request(GlobalVariable.urlBaseApi+"/records",headers,HTTPClient.METHOD_POST,json)


func _on_http_request_request_completed(result, response_code, headers, body):
	print(JSON.parse_string(body.get_string_from_utf8()))
	get_tree().change_scene_to_file(ruteScene)
