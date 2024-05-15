extends State


var jumpBend=0

# Called when the node enters the scene tree for the first time.
func Enter():
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
		
	if !player.is_on_floor():
		Transitioned.emit(self,"Fall")
	player.move_and_slide()
	
	if !Input.is_action_pressed("Bend"):
		Transitioned.emit(self, "Idle")
	

	
