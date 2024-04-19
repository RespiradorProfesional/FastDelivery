extends State

@export var animation_Tree : AnimationTree
@onready var fsm = get_parent()
#@export var jump_horizontal_speed=500

var wall_jump=true
var player : CharacterBody2D
var last_position=0

# hacer que s epueda mover despues de un wall jump pero la direccion ahora tiene que ser contraria
# a la que hizo la ultima vez que hizo el wall jump

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	player.velocity.y += -fsm.jump
	wall_jump=true
	#animation_Tree.set("")
	pass

func Update(_delta : float):
	var direction = Input.get_axis("MoveLeft", "MoveRight")
	player.velocity.y += fsm.gravity * _delta
	
	
	if direction!=0:
			last_position=direction
			
	if not player.is_on_floor() and wall_jump:
		player.velocity.x = direction * fsm.speed
#		player.velocity.x = direction * jump_horizontal_speed

	if player.is_on_wall() and Input.is_action_just_pressed("Jump"):
		player.velocity.y += -fsm.jump
		print(last_position)
		player.velocity.x = -last_position * fsm.speed
		last_position= last_position * -1
		wall_jump=false
	
	player.move_and_slide()
	
	
	if(player.is_on_floor()):
		Transitioned.emit(self, "Idle")
	
