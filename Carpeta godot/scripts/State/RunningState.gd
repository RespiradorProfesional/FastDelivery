extends State

@export var animation_Tree : AnimationTree
@onready var fsm = get_parent()

@export var dashSpeed=10
var player : CharacterBody2D

var canDash=false

# Called when the node enters the scene tree for the first time.
func Enter():
	fsm.resetJumpWall=true
	player = get_tree().get_first_node_in_group("Player")
	#animation_Tree.set("")
	pass

func Update(_delta : float):
	print("moviendo")
	#var input_dir = Input.get_axis("MoveLeft", "MoveRight")
		
	
	var direction = Input.get_axis("MoveLeft", "MoveRight")
	if direction:
		player.velocity.x = direction * fsm.speed
	else:
		Transitioned.emit(self, "Idle")
	
	player.move_and_slide()
	
	if Input.is_action_just_pressed("Jump"):
		Transitioned.emit(self, "Jump")
	if !player.is_on_floor():
		Transitioned.emit(self,"Fall")

