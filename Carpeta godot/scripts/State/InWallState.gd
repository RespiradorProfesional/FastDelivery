extends State


@export var animation_Tree : AnimationTree
@onready var fsm = get_parent()

var player : CharacterBody2D
var lastDirection=0
var lastDirectionJump=0

# hacer que s epueda mover despues de un wall jump pero la direccion ahora tiene que ser contraria
# a la que hizo la ultima vez que hizo el wall jump

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	if fsm.resetJumpWall :
		lastDirectionJump=0
		player.velocity.y = 0
		fsm.resetJumpWall=false
	pass

func Update(_delta : float):
	var direction = Input.get_axis("MoveLeft", "MoveRight")
	
	if direction!=0 :
		lastDirection=direction
	
	if player.velocity.y<fsm.gravityInWall:
		player.velocity.y=fsm.gravityInWall
	
	player.velocity.y += fsm.gravityInWall * _delta
	
	if Input.is_action_just_pressed("Jump") and lastDirectionJump!=lastDirection:
		player.velocity.x = -lastDirection * fsm.jump
		lastDirectionJump= lastDirection
		Transitioned.emit(self, "WallJump")
	else:
		player.velocity.x = direction * fsm.speed
	
	
	player.move_and_slide()
	
	if !player.is_on_wall():
		Transitioned.emit(self, "Fall")
	if(player.is_on_floor()):
		Transitioned.emit(self, "Idle")
	
