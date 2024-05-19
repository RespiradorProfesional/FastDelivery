extends Control

#En este script se maneja el menu principal y sus botones que cambian de escena, 
#y tambien la gestión del usuario que puede eliminar su cuenta o modificar su contraseña

@onready var mainContainer= $HBoxMainScreen
@onready var userContainer= $VBoxUserScreen
@onready var newPasswordContainer=$VBoxUserScreen/VBoxContainer/newPasswordContainer
@onready var newPassword=$VBoxUserScreen/VBoxContainer/newPasswordContainer/NewPassword
@onready var httpRequest=$VBoxUserScreen/HTTPRequest
@onready var colorRectUserScreen=$ColorRectUserScreen
@onready var motoCycleImage=$MotoCycle

#Pone en marcha una animación y la música del menu
func _ready():
	menu_hover()
	AudioPlayerBackground.play_music_main_background()

func menu_hover():
	var menuHover = get_tree().create_tween().set_loops()
	menuHover.tween_property(motoCycleImage, "position", Vector2(1050,400),2.3)
	menuHover.tween_property(motoCycleImage, "position", Vector2(1150,400),2.3)
	

func _input(event):
	if Input.is_action_just_pressed("Escape"):
		colorRectUserScreen.visible=false
		userContainer.visible=false

func _on_jugar_button_pressed():
	AudioPlayerBackground.play_sound_button()
	get_tree().change_scene_to_file("res://scenes/Ui/LevelSelect.tscn")

func _on_records_pressed():
	AudioPlayerBackground.play_sound_button()
	get_tree().change_scene_to_file("res://scenes/Ui/RecordsScreen.tscn")
	

func _on_ajute_button_pressed():
	AudioPlayerBackground.play_sound_button()
	colorRectUserScreen.visible=true
	userContainer.visible=true


func _on_modify_user_button_pressed():
	
	if newPasswordContainer.visible==true:
		newPasswordContainer.visible=false
	else:
		newPasswordContainer.visible=true

#Realiza la petición de eliminar la cuenta del usuario que inicio sesión

func _on_delete_user_button_pressed():
	var headers = ["Content-Type: application/json"]
	httpRequest.request(GlobalVariable.urlBaseApi+"/user/"+GlobalVariable.userName+"/"+GlobalVariable.userPassw,headers,HTTPClient.METHOD_DELETE)

#Realiza la petición de modificar la contraseña de la cuenta del usuario que inicio sesión

func _on_button_pressed():
	
	var json = JSON.stringify({"password":newPassword.text})
	
	var headers = ["Content-Type: application/json"]
	httpRequest.request(GlobalVariable.urlBaseApi+"/user/"+GlobalVariable.userName+"/"+GlobalVariable.userPassw,headers,HTTPClient.METHOD_PUT,json)


func _on_http_request_request_completed(result, response_code, headers, body):
	get_tree().change_scene_to_file("res://scenes/Ui/StartMenu.tscn")



func _on_leave_pressed():
	get_tree().quit()


func _on_creditos_pressed():
	AudioPlayerBackground.play_sound_button()
	get_tree().change_scene_to_file("res://scenes/Ui/Credits.tscn")


func _on_como_jugar_pressed():
	AudioPlayerBackground.play_sound_button()
	get_tree().change_scene_to_file("res://scenes/Ui/Controles.tscn")
