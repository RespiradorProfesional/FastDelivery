extends State

var finishJumpTime

#Este estado maneja el salto que se realiza despues de estar en el estado
#"InWall"

func Enter():
	player.velocity.y += -fsm.jump*1.25
	finishJumpTime=false
	await get_tree().create_timer(0.3).timeout
	finishJumpTime=true
	pass

func Update(_delta : float):
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
