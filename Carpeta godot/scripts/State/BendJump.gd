extends State

var finishJumpTime

#Es un estado del personaje en el cual el personaje al realizar un salto mientras
#esta agachado no se puede mover y sigue recto segun la orientacion del salto

func Enter():
	player.velocity.y += -fsm.jump
	pass

func Update(_delta : float):
	#Gravedad del personaje
	player.velocity.y += fsm.gravity * _delta
	
	player.move_and_slide()
	
	if player.is_on_floor() and Input.is_action_pressed("Bend"):
		Transitioned.emit(self, "Bend")
	if player.is_on_wall():
		Transitioned.emit(self, "InWall")
	if  player.is_on_floor():
		Transitioned.emit(self, "Idle")
