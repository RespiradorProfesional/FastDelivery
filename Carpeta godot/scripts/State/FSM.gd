extends Node
class_name FiniteStateMachine

#En este script se maneja el cambio entre estados, y el uso de los metodos
#que poseen los estados

#Estas variables son las diferentes estadísticas del personaje que son usados
#en los estados del mismo para manejar su movilidad 
@export var speed=200
@export var bendSpeed=100
@export var slideSpeed=400
@export var gravity=500
@export var gravityInWall=50
@export var jumpMaxBend=600
@export var jump=200

@export var animation_Tree : AnimationTree
@export var animation_Player : AnimationPlayer

var resetJumpWall=true
var resetGravityWall=true

#Esta variable guarda la ultima direccion realizada por el jugador
var lastDirection=1

var states : Dictionary = {}
var current_state : State
@export var initial_state : State


#Al iniciarse el script, incorpora un estado base que posee en la variable
#"initial_state" y conecta las señales de todos los estados al metodo "change_state"
func _ready():
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.Transitioned.connect(change_state)

	if initial_state:
		initial_state.Enter()
		current_state = initial_state

#Llama al metodo Update() del estado actual constantemente
func _process(delta):
	if current_state:
			current_state.Update(delta)
	
	if (lastDirection!=0):
		for path in GlobalVariable.blend_pos_paths:
			animation_Tree.set(path, lastDirection)
	
	

#Se maneja el cambio de estados segun la señal emitida por los 
#mismos
func change_state(source_state : State, new_state_name : String):
	
	if !GlobalVariable.isChatting:
		if source_state != current_state:
			return
		
		var new_state = states.get(new_state_name.to_lower())
		if !new_state:
			print("New state is empty")
			return
			
		if current_state:
			current_state.Exit()
			
		new_state.Enter()
		
		current_state = new_state
		animation_change(new_state_name.to_lower())

#Segun en el estado actual del jugador, se le incorpora una animación
func animation_change(new_state_name):
	animation_Tree.set("parameters/conditions/IsIdle",new_state_name=="idle")
	animation_Tree.set("parameters/conditions/IsRunning",new_state_name=="running")
	animation_Tree.set("parameters/conditions/IsJump", new_state_name=="jump")
	animation_Tree.set("parameters/conditions/IsFall",new_state_name=="fall")
	animation_Tree.set("parameters/conditions/IsBend",new_state_name=="bend")
	animation_Tree.set("parameters/conditions/IsInWall", new_state_name=="inwall")
	animation_Tree.set("parameters/conditions/IsWallJump", new_state_name=="walljump")
	animation_Tree.set("parameters/conditions/IsBendJump", new_state_name=="bendjump")
	animation_Tree.set("parameters/conditions/IsSlide", new_state_name=="slide")



