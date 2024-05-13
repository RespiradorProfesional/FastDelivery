extends Control

@onready var userSesion=$UserSesion
@onready var labelStart=$VBoxPressStart/LabelStart
@onready var http_requestlogin= $HTTPRequestLogin
@onready var http_requestregister= $HTTPRequestRegister
@onready var nameTextField= $UserSesion/NameTextField
@onready var passwTextField= $UserSesion/PasswTextField
@onready var colorRectUserSesion=$ColorRectUserSesion
@onready var logoFImage=$VBoxContainer/VBoxContainer/logoF
@onready var vBoxPressStart=$VBoxPressStart

# Called when the node enters the scene tree for the first time.
func _ready():
	AudioPlayerBackground.play_music_start_sreen_background()

func _input(event):
	if event is InputEventKey:
		var key_event = event as InputEventKey
		if key_event.pressed:
			labelStart.visible=false
			vBoxPressStart.visible=false
			userSesion.visible=true
			colorRectUserSesion.visible=true





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
