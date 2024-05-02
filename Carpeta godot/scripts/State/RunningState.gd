extends State

@export var animation_Tree : AnimationTree
@onready var fsm = get_parent()

@export var dashSpeed=10
var player : CharacterBody2D
#va al reves derecha y izquierda osea no se para
var canDash=false

# Called when the node enters the scene tree for the first time.
func Enter():
	player = get_tree().get_first_node_in_group("Player")
	
	fsm.resetJumpWall=true
	pass

func Update(_delta : float):
	
	var direction = Input.get_axis("MoveLeft", "MoveRight")
	if direction:
		player.velocity.x = direction * fsm.speed
	
	
	player.move_and_slide()
	print("moviendo")
	
	
	if player.velocity.x==0 or direction==0:
		Transitioned.emit(self, "Idle")
	
	
	#animation_Tree.set("")
	if Input.is_action_just_pressed("Jump"):
		Transitioned.emit(self, "Jump")
	if Input.is_action_just_pressed("Slide"):
		Transitioned.emit(self, "Slide")
	if !player.is_on_floor():
		Transitioned.emit(self,"Fall")

	if Input.is_action_just_pressed("Bend"):
		Transitioned.emit(self, "Bend")
