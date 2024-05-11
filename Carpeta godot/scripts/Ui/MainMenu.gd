extends Control

@onready var mainContainer= $HBoxMainScreen
@onready var userContainer= $VBoxUserScreen

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/Levels/Level1.tscn")


func _on_records_pressed():
	get_tree().change_scene_to_file("res://scenes/Ui/RecordsScreen.tscn")
	

func _on_ajute_pressed():
	userContainer.visible=true
	#mainContainer.disable=true
