extends State

#Este estado maneja cuando el jugador esta al lado de una pared alejada del suelo
#ademas maneja el estado "WallJump" guardando la ultima direccion en la cual
#el jugador hizo el ultimo wall jump, para que no pueda repetir la misma direccion
#sin alternar con la otra

var lastDirection=0
var lastDirectionJump=0

func Enter():
	if fsm.resetJumpWall :
		lastDirectionJump=0
		player.velocity.y = 0
		fsm.resetJumpWall=false

func Update(_delta : float):
	
	if direction!=0 :
		lastDirection=direction
	
	if player.velocity.y<fsm.gravityInWall:
		player.velocity.y=fsm.gravityInWall
	
	player.velocity.y += fsm.gravityInWall * _delta
	
	if Input.is_action_just_pressed("Jump") and lastDirectionJump!=lastDirection:
		player.velocity.x = -lastDirection * fsm.jump
		lastDirectionJump= lastDirection
		Transitioned.emit(self, "WallJump")
	else:
		player.velocity.x = direction * fsm.speed
	
	
	player.move_and_slide()
	
	if player.is_on_floor() and Input.is_action_pressed("Bend"):
		Transitioned.emit(self, "Bend")
	if !player.is_on_wall():
		Transitioned.emit(self, "Fall")
	if(player.is_on_floor()):
		Transitioned.emit(self, "Idle")
	
