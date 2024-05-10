extends Control


@onready var http_request= $HTTPRequest
@onready var vBox= $VBoxContainer
@onready var label_template= $LabelTemplate


# Called when the node enters the scene tree for the first time.
func _ready():
	http_request.request(GlobalVariable.urlBaseApi+"/records/1")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_http_request_request_completed(result, response_code, headers, body):
	var data= JSON.parse_string(body.get_string_from_utf8())
	
	
	for records in data.data:
		create_label(str(records))
	
	print(data.data[0])

func create_label(texto: String):
	# Clona la plantilla de etiqueta
	var new_label = label_template.duplicate()
	# Configura el texto de la etiqueta
	new_label.text = texto
	# Agrega la etiqueta al padre (por ejemplo, un VBoxContainer)
	vBox.add_child(new_label)
