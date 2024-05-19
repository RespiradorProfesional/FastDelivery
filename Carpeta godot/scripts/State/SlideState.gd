extends State

var actualVelocity=0
var lastDirection=0

#Este estado maneja cuando el jugador se desliza, no puede cambiar de direccion
#y al principio del estado el jugador se mueve mas rapido pero esta velocidad
#baja rapidamente

func Enter():
	lastDirection = direction
	
	player.velocity.x = lastDirection * fsm.slideSpeed
	actualVelocity=0
	pass

func Update(_delta : float):
	actualVelocity+=2
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
