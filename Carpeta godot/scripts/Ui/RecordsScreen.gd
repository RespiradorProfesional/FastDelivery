extends Control

@onready var labelLevel=$HBoxContainer/VBoxContainer2/LabelLevel
@onready var imageLevel=$HBoxContainer/VBoxContainer2/ImageLevel
@onready var buttonNivel1=$"HBoxContainer/VBoxContainer/Nivel 1"


func _input(event):
	if Input.is_action_just_pressed("Escape"):
		get_tree().change_scene_to_file("res://scenes/Ui/MainMenu.tscn")


func _on_nivel_1_pressed():
	get_tree().change_scene_to_file("res://scenes/Ui/LevelRecordsScreen1.tscn")


func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/Ui/MainMenu.tscn")


func _on_nivel_1_mouse_entered():
	labelLevel.text=buttonNivel1.text
