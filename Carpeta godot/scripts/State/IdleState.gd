extends State
class_name PlayerIdle

#momento dado para no obtener el player cada vez que entras a un estado puedo crear un nuevo
#metodo en State y poner al atributo de player para que todas las clases que 
#extiendan de el lo tengan



func Enter():
	fsm.resetJumpWall=true
	
	#animation_Tree.set("")

func Update(_delta : float):
	
	if Input.get_axis("MoveLeft", "MoveRight"):
		Transitioned.emit(self, "Running")

	if !player.is_on_floor():
		Transitioned.emit(self,"Fall")
	
	if Input.is_action_pressed("Jump"):
		Transitioned.emit(self, "Jump")
	
	if Input.is_action_just_pressed("Bend"):
		Transitioned.emit(self, "Bend")
