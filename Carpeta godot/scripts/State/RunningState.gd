extends State

# Called when the node enters the scene tree for the first time.
func Enter():
	fsm.resetJumpWall=true
	pass

func Update(_delta : float):
	
	
	if direction:
		player.velocity.x = direction * fsm.speed
	
	
	player.move_and_slide()
	
	
	if player.velocity.x==0 or direction==0:
		Transitioned.emit(self, "Idle")
	
	
	#animation_Tree.set("")
	if Input.is_action_pressed("Jump"):
		Transitioned.emit(self, "Jump")
	if Input.is_action_just_pressed("Slide"):
		Transitioned.emit(self, "Slide")
	if !player.is_on_floor():
		Transitioned.emit(self,"Fall")

	if Input.is_action_just_pressed("Bend"):
		Transitioned.emit(self, "Bend")
