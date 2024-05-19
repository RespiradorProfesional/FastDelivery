extends Node2D

#En esta escena se maneja el tiempo transcurrido en el nivel y hace la solicitud
#de POST a la api guardando el record del jugador en el nivel indicado en la
#variable "actualLevel_id"

@onready var timer=$Timer
@export var ruteScene=""
@export var actualLevel_id=0
var seconds
@onready var cronometre=$CanvasLayer/Label
@onready var finalLevel=$finalLevel
@onready var httpdRequest=$HTTPRequest
@onready var loadingLayer=$LoadingLayer

var tiempoFormateado

#Al inicializar el script resetea todos los valores
func _ready():
	tiempoFormateado= "0:00"
	seconds=0
	cronometre.text=tiempoFormateado
	loadingLayer.visible=false

func start_time():
	timer.start()

func _on_timer_timeout():
	seconds+=1
	cronometre.text=GlobalVariable.formatTime(seconds)


#Al entrar al area indicada, se realiza la petición a la api 
func _on_final_level_body_entered(body):
	var newScene = load(ruteScene)
	var json = JSON.stringify({"user_id":GlobalVariable.userId,"level_id":actualLevel_id,"time":seconds})
	
	GlobalVariable.score=seconds
	var headers = ["Content-Type: application/json"]
	loadingLayer.visible=true
	httpdRequest.request(GlobalVariable.urlBaseApi+"/records",headers,HTTPClient.METHOD_POST,json)


#Al completarse la petición se cambia de escena
func _on_http_request_request_completed(result, response_code, headers, body):
	get_tree().change_scene_to_file(ruteScene)
