extends Control

#Este script unicamente se utiliza para poder volver al mainMenu al pulsar ESC

func _input(event):
	if Input.is_action_just_pressed("Escape"):
		get_tree().change_scene_to_file("res://scenes/Ui/MainMenu.tscn")
