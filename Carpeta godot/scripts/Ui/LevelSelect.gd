extends Control

@onready var nivel1Button=$"VBoxContainer/Nivel 1"


func _on_nivel_1_pressed():
	AudioPlayerBackground.play_sound_button()
	get_tree().change_scene_to_file("res://scenes/Levels/Level1Town.tscn")

func _input(event):
	if Input.is_action_just_pressed("Escape"):
		get_tree().change_scene_to_file("res://scenes/Ui/MainMenu.tscn")
