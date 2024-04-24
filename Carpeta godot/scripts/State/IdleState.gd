extends State
class_name PlayerIdle
var player : CharacterBody2D
@export var animation_Tree : AnimationTree
@onready var fsm = get_parent()

# Called when the node enters the scene tree for the first time.
func Enter():
	fsm.resetJumpWall=true
	player = get_tree().get_first_node_in_group("Player")
	pass
	#animation_Tree.set("")

func Update(_delta : float):
	print("quieto")
	if(Input.get_axis("MoveLeft", "MoveRight")):
		Transitioned.emit(self, "Running")
		
	if !player.is_on_floor():
		Transitioned.emit(self,"Fall")
	
	if Input.is_action_just_pressed("Jump"):
		Transitioned.emit(self, "Jump")
