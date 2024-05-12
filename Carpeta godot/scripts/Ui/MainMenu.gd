extends Control

@onready var mainContainer= $HBoxMainScreen
@onready var userContainer= $VBoxUserScreen
@onready var newPasswordContainer=$VBoxUserScreen/newPasswordContainer
@onready var newPassword=$VBoxUserScreen/newPasswordContainer/NewPassword
@onready var httpRequest=$VBoxUserScreen/HTTPRequest

# Called when the node enters the scene tree for the first time.
func _ready():
	AudioPlayerBackground.play_music_main_background()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_jugar_button_pressed():
	AudioPlayerBackground.play_music_level1_background()
	get_tree().change_scene_to_file("res://scenes/Levels/Level1.tscn")

func _on_records_pressed():
	get_tree().change_scene_to_file("res://scenes/Ui/RecordsScreen.tscn")
	

func _on_ajute_button_pressed():
	userContainer.visible=true


func _on_modify_user_button_pressed():
	if newPasswordContainer.visible==true:
		newPasswordContainer.visible=false
	else:
		newPasswordContainer.visible=true

func _on_delete_user_button_pressed():
	
	print(GlobalVariable.urlBaseApi+"/user/"+GlobalVariable.userName+"/"+GlobalVariable.userPassw)
	var headers = ["Content-Type: application/json"]
	httpRequest.request(GlobalVariable.urlBaseApi+"/user/"+GlobalVariable.userName+"/"+GlobalVariable.userPassw,headers,HTTPClient.METHOD_DELETE)


func _on_button_pressed():
	
	var json = JSON.stringify({"password":newPassword.text})
	
	var headers = ["Content-Type: application/json"]
	httpRequest.request(GlobalVariable.urlBaseApi+"/user/"+GlobalVariable.userName+"/"+GlobalVariable.userPassw,headers,HTTPClient.METHOD_PUT,json)


func _on_http_request_request_completed(result, response_code, headers, body):
	print(JSON.parse_string(body.get_string_from_utf8()))
	get_tree().change_scene_to_file("res://scenes/Ui/StartMenu.tscn")

