extends State
class_name PlayerIdle

#En este estado se maneja cuando el jugador esta quieto

func Enter():
	fsm.resetJumpWall=true

func Update(_delta : float):
	
	if Input.get_axis("MoveLeft", "MoveRight"):
		Transitioned.emit(self, "Running")

	if !player.is_on_floor():
		Transitioned.emit(self,"Fall")
	
	if Input.is_action_pressed("Jump"):
		Transitioned.emit(self, "Jump")
	
	if Input.is_action_just_pressed("Bend"):
		Transitioned.emit(self, "Bend")
