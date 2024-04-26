extends State

@export var animation_Tree : AnimationTree
@onready var fsm = get_parent()
var actualVelocity=0
var lastDirection=0

var player : CharacterBody2D
# Called when the node enters the scene tree for the first time.
func Enter():
	player = get_tree().get_first_node_in_group("Player")
	lastDirection = Input.get_axis("MoveLeft", "MoveRight")
	
	player.velocity.x = lastDirection * fsm.slideSpeed
	actualVelocity=0
	#animation_Tree.set("")
	pass

func Update(_delta : float):
	
	
	actualVelocity+=5
	print("Slide")
	print(player.velocity.x)
	
	if lastDirection==-1:
		if player.velocity.x<0:
			player.velocity.x += -lastDirection * actualVelocity
		else:
			player.velocity.x =0
	else :
		if player.velocity.x>0:
			player.velocity.x += -lastDirection * actualVelocity
		else:
			player.velocity.x =0
	
	
	player.move_and_slide()
	
	if !player.is_on_floor():
		Transitioned.emit(self,"Fall")
	if Input.is_action_pressed("Jump"):
		Transitioned.emit(self, "Jump")
	if !Input.is_action_pressed("Slide"):
		Transitioned.emit(self, "Idle")
