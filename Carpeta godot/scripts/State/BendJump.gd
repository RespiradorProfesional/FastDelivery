extends State


@export var animation_Tree : AnimationTree
@onready var fsm = get_parent()
#@export var jump_horizontal_speed=500

var player : CharacterBody2D
var finishJumpTime

# hacer que s epueda mover despues de un wall jump pero la direccion ahora tiene que ser contraria
# a la que hizo la ultima vez que hizo el wall jump

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	player.velocity.y += -fsm.jump
	pass

func Update(_delta : float):
	player.velocity.y += fsm.gravity * _delta
	
	player.move_and_slide()
	
	if player.is_on_wall():
		Transitioned.emit(self, "InWall")
	if  player.is_on_floor():
		Transitioned.emit(self, "Idle")
