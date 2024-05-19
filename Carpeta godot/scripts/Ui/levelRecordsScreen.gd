extends Control
class_name levelRecordsScript

#Este script se usa para para mostrar los datos de la api "Records"
#Generando la vista dependiendo del numero de respuestas hasta un maximo de 20

@export var level=""
@export var levelName=""
@onready var http_request= $HTTPRequest
@onready var vBox= $VBoxContainer
@onready var label_template= $LabelTemplate
@onready var hboxTemplate=$HboxTemplate
@onready var titleText=$VBoxContainer/TitleLabel


func _ready():
	http_request.request(GlobalVariable.urlBaseApi+"/records/"+level)
	titleText.text="Records " + levelName

func _input(event):
	if Input.is_action_just_pressed("Escape"):
		get_tree().change_scene_to_file("res://scenes/Ui/RecordsScreen.tscn")

func _on_http_request_request_completed(result, response_code, headers, body):
	
	var data= JSON.parse_string(body.get_string_from_utf8())
	var count = 0
	for records in data.data:
		create_label(str(records["username"]),GlobalVariable.formatTime(int(str(records["completion_time_seconds"]))))
		count += 1
		if count >= 20:
			break
	

func create_label(text: String,textPoints: String):
	# Clona la plantilla de etiqueta
	var new_label = label_template.duplicate()
	var new_label2 = label_template.duplicate()
	var hBox = hboxTemplate.duplicate() 
	# Configura el texto de la etiqueta
	new_label.text = text
	new_label2.text = textPoints
	hBox.add_child(new_label)
	hBox.add_child(new_label2)
	# Agrega la etiqueta al padre (por ejemplo, un VBoxContainer)
	vBox.add_child(hBox)


func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/Ui/RecordsScreen.tscn")

