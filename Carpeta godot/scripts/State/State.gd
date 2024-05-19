extends Node
class_name State

#Esta es la clase base de todos los estados, todos los estado heredan de esta
#clase sus metodos y los metodos que posean pass son para reescribirlos, y 
#realizar la funcionalidad especifica del estado

var direction = 1
@onready var fsm = get_parent()

var player : CharacterBody2D

#Se crea la señal para manejar los estados desde el script FSM
signal Transitioned

func _ready():
	player = get_tree().get_first_node_in_group("Player")

#Guarda la direccion en la cual se mueve el jugador

func _input(event):
	if event is InputEventKey and !GlobalVariable.isChatting:
		direction=Input.get_axis("MoveLeft", "MoveRight")
		fsm.lastDirection=direction

func Enter():
	pass
	
func Exit():
	pass
	
func Update(_delta:float):
	pass

#Se usa la variable "blend_pos_paths" de GlobalVariable, para actualizar la dirección
#de la animacion
func update_animation(input_dir):
	for path in GlobalVariable.blend_pos_paths: #tal vez afecta al rendiiento
		fsm.animation_tree.set(path, input_dir)
