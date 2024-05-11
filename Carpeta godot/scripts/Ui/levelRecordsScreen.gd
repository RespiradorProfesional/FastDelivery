extends Control
class_name levelRecordsScript

@export var level=""
@onready var http_request= $HTTPRequest
@onready var vBox= $VBoxContainer
@onready var label_template= $LabelTemplate
@onready var hboxTemplate=$HboxTemplate



# Called when the node enters the scene tree for the first time.
func _ready():
	http_request.request(GlobalVariable.urlBaseApi+"/records/"+level)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_http_request_request_completed(result, response_code, headers, body):
	var data= JSON.parse_string(body.get_string_from_utf8())
	
	
	for records in data.data:
		create_label(str(records["username"]),str(records["completion_time_seconds"]))
	
	print(data.data[0])

func create_label(texto: String,textoPoints: String):
	# Clona la plantilla de etiqueta
	var new_label = label_template.duplicate()
	var new_label2 = label_template.duplicate()
	var hBox = hboxTemplate.duplicate() 
	# Configura el texto de la etiqueta
	new_label.text = texto
	new_label2.text = textoPoints
	hBox.add_child(new_label)
	hBox.add_child(new_label2)
	# Agrega la etiqueta al padre (por ejemplo, un VBoxContainer)
	vBox.add_child(hBox)
