extends State


#Es un estado del personaje, es cuando el personaje esta agachado

#En esta variable se guarda la potencia del salto agachado del personaje cuando
#mantiene pulsado la accion "Jump"
var jumpBend=0

func Enter():
	jumpBend=0


func Update(_delta : float):
	player.velocity.x = direction * fsm.bendSpeed
	
	#Si el jugador mantiene pulsado "Jump" Carga el salto
	if Input.is_action_pressed("Jump"):
		if jumpBend<=fsm.jumpMaxBend:
			jumpBend+=5
		player.velocity.x=0
	
	#Si el jugador suelta el boton pulsado "Jump" realiza el salto
	if Input.is_action_just_released("Jump"):
		player.velocity.x = direction * jumpBend
		Transitioned.emit(self, "BendJump")
		
	if !player.is_on_floor():
		Transitioned.emit(self,"Fall")
	player.move_and_slide()
	
	if !Input.is_action_pressed("Bend"):
		Transitioned.emit(self, "Idle")
	

	
