extends Control

@onready var userSesion=$VBoxContainer/UserSesion
@onready var LabelStart=$VBoxContainer/LabelStart
@onready var http_requestlogin= $HTTPRequestLogin
@onready var http_requestregister= $HTTPRequestRegister
@onready var nameTextField= $VBoxContainer/UserSesion/NameTextField
@onready var passwTextField= $VBoxContainer/UserSesion/PasswTextField



# Called when the node enters the scene tree for the first time.
func _ready():
	AudioPlayerBackground.play_music_start_sreen_background()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _input(event):
	if event is InputEventKey:
		var key_event = event as InputEventKey
		if key_event.pressed:
			LabelStart.visible=false
			userSesion.visible=true




func _on_login_button_pressed():
	http_requestlogin.request(GlobalVariable.urlBaseApi+"/user/" + nameTextField.text + "/" +passwTextField.text)

func _on_register_button_pressed():
	var json = JSON.stringify({"username":nameTextField.text,"password":passwTextField.text})
	
	var headers = ["Content-Type: application/json"]
	http_requestregister.request(GlobalVariable.urlBaseApi+"/user",headers,HTTPClient.METHOD_POST,json)

func _on_http_request_login_request_completed(result, response_code, headers, body):
	var data= JSON.parse_string(body.get_string_from_utf8())
	
	
	if data["response"]==true:
		GlobalVariable.userId=data.user.user_id
		GlobalVariable.userName=data.user.username
		GlobalVariable.userPassw=data.user.password
		get_tree().change_scene_to_file("res://scenes/Ui/MainMenu.tscn")
	else :
		print("no")
	

func _on_http_request_register_request_completed(result, response_code, headers, body):
	print(JSON.parse_string(body.get_string_from_utf8()))
