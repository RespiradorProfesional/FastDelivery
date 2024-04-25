extends State

@export var animation_Tree : AnimationTree
@onready var fsm = get_parent()
var jumpBend=0

var player : CharacterBody2D
# Called when the node enters the scene tree for the first time.
func Enter():
	player = get_tree().get_first_node_in_group("Player")
	jumpBend=0
	#animation_Tree.set("")
	pass

func Update(_delta : float):
	var direction = Input.get_axis("MoveLeft", "MoveRight")
	
	
	player.velocity.x = direction * fsm.bendSpeed
	
	print("Agacharse")
	if Input.is_action_pressed("Jump"):
		if jumpBend<=fsm.jumpMaxBend:
			jumpBend+=5
		player.velocity.x=0
	
	if Input.is_action_just_released("Jump"):
		player.velocity.x = direction * jumpBend
		Transitioned.emit(self, "BendJump")
		
	player.move_and_slide()
	
	if !Input.is_action_pressed("Bend"):
		Transitioned.emit(self, "Idle")
	

	
