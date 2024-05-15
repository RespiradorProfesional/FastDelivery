extends Node
class_name State

@export var animation_Tree : AnimationTree
@onready var fsm = get_parent()
var player : CharacterBody2D
#NOTE This is the State base-class, all our specific states inherits this logic
# DO NOT CHANGE THIS unless you know what you are doing

signal Transitioned

func _ready():
	player = get_tree().get_first_node_in_group("Player")

func Enter():
	pass
	
func Exit():
	pass
	
func Update(_delta:float):
	pass
	
