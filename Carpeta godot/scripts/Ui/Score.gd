extends Node2D

@onready var timer=$Timer
@export var ruteScene=""
@export var actualLevel_id=0
var seconds
@onready var cronometre=$CanvasLayer/Label
@onready var finalLevel=$finalLevel
@onready var httpdRequest=$HTTPRequest
@onready var loadingLayer=$LoadingLayer

var tiempoFormateado
# Called when the node enters the scene tree for the first time.
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



func _on_final_level_body_entered(body):
	var newScene = load(ruteScene)
	var json = JSON.stringify({"user_id":GlobalVariable.userId,"level_id":actualLevel_id,"time":seconds})
	
	GlobalVariable.score=seconds
	var headers = ["Content-Type: application/json"]
	loadingLayer.visible=true
	httpdRequest.request(GlobalVariable.urlBaseApi+"/records",headers,HTTPClient.METHOD_POST,json)



func _on_http_request_request_completed(result, response_code, headers, body):
	get_tree().change_scene_to_file(ruteScene)
