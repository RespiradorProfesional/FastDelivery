extends State

# En este estado se maneja la caída del personaje 

func Enter():
	pass

func Update(_delta : float):
	player.velocity.y += fsm.gravity * _delta
	player.velocity.x = direction * fsm.speed
	player.move_and_slide()
	if player.is_on_floor() and Input.is_action_pressed("Slide") and direction!=0:
		Transitioned.emit(self, "Slide")
	if player.is_on_floor() and Input.is_action_pressed("Bend"):
		Transitioned.emit(self, "Bend")
	if(player.is_on_floor()):
		Transitioned.emit(self, "Idle")
	
	if(player.is_on_wall()):
		Transitioned.emit(self, "InWall")
	
	
