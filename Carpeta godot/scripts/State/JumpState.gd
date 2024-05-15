extends State


# hacer que s epueda mover despues de un wall jump pero la direccion ahora tiene que ser contraria
# a la que hizo la ultima vez que hizo el wall jump

func Enter():
	player.velocity.y += -fsm.jump
	pass

func Update(_delta : float):
	var direction = Input.get_axis("MoveLeft", "MoveRight")
	player.velocity.y += fsm.gravity * _delta
	
	player.velocity.x = direction * fsm.speed
	
	player.move_and_slide()
	
	if player.is_on_floor() and Input.is_action_pressed("Bend"):
		Transitioned.emit(self, "Bend")
	if player.is_on_floor() and Input.is_action_pressed("Slide") and direction!=0:
		Transitioned.emit(self, "Slide")
	if player.is_on_wall():
		Transitioned.emit(self, "InWall")
	if(player.is_on_floor()):
		Transitioned.emit(self, "Idle")
	
