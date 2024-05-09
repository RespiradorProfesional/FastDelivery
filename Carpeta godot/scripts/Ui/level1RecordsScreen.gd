extends Control


@onready var http_request= $HTTPRequest
@onready var label1=$VBoxContainer/Label
@onready var label2=$VBoxContainer/Label2
@onready var label3=$VBoxContainer/Label3
@onready var label4=$VBoxContainer/Label4
@onready var label5=$VBoxContainer/Label5
@onready var label6=$VBoxContainer/Label6
@onready var label7=$VBoxContainer/Label7
@onready var label8=$VBoxContainer/Label8
@onready var label9=$VBoxContainer/Label9
@onready var label10=$VBoxContainer/Label10



# Called when the node enters the scene tree for the first time.
func _ready():
	http_request.request(GlobalVariable.urlBaseApi+"/records/1")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_http_request_request_completed(result, response_code, headers, body):
	var data= JSON.parse_string(body.get_string_from_utf8())
	label1.text=str(data.data[0])
	label2.text=str(data.data[1])
	label3.text=str(data.data[2]) #mirar alguna forma de hacerlo que dependiendo de las respuesta
	 #te cree mas o menos labels
	
	print(data.data[0])
