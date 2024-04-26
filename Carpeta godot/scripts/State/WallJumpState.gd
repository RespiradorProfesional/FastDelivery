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
	finishJumpTime=false
	await get_tree().create_timer(0.3).timeout
	finishJumpTime=true
	pass

func Update(_delta : float):
	var direction = Input.get_axis("MoveLeft", "MoveRight")
	player.velocity.y += fsm.gravity * _delta
	
	if direction!=0 and finishJumpTime:
		player.velocity.x = direction * fsm.speed
	
	player.move_and_slide()
	if player.is_on_floor() and Input.is_action_pressed("Slide") and direction!=0:
		Transitioned.emit(self, "Slide")
	if player.is_on_floor() and Input.is_action_pressed("Bend"):
		Transitioned.emit(self, "Bend")
	if player.is_on_wall():
		Transitioned.emit(self, "InWall")
	if(player.is_on_floor()):
		Transitioned.emit(self, "Idle")
