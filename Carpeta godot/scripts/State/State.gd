extends Node
class_name State


var direction = 1
@onready var fsm = get_parent()

var player : CharacterBody2D
#NOTE This is the State base-class, all our specific states inherits this logic
# DO NOT CHANGE THIS unless you know what you are doing

signal Transitioned

func _ready():
	player = get_tree().get_first_node_in_group("Player")

func _input(event):
	if event is InputEventKey and !GlobalVariable.isChatting:
		direction=Input.get_axis("MoveLeft", "MoveRight")
		fsm.lastDirection=direction

func Enter():
	pass
	
func Exit():
	pass
	
func Update(_delta:float):
	pass
	
func update_animation(input_dir):
	for path in GlobalVariable.blend_pos_paths: #tal vez afecta al rendiiento
		fsm.animation_tree.set(path, input_dir)
