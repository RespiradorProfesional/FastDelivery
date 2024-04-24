extends State

@export var animation_Tree : AnimationTree
@onready var fsm = get_parent()

var player : CharacterBody2D
# Called when the node enters the scene tree for the first time.
func Enter():
	player = get_tree().get_first_node_in_group("Player")
	
	#animation_Tree.set("")
	pass

func Update(_delta : float):
	var direction = Input.get_axis("MoveLeft", "MoveRight")
	player.velocity.y += fsm.gravity * _delta
	player.velocity.x = direction * fsm.speed
	player.move_and_slide()
	
	print("Cayendo")
	if(player.is_on_floor()):
		Transitioned.emit(self, "Idle")
	
	if(player.is_on_wall()):
		Transitioned.emit(self, "InWall")
	
	
