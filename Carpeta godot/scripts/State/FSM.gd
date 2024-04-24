extends Node
class_name FiniteStateMachine


@export var speed=500
@export var gravity=100
@export var gravityInWall=50
@export var jump=40
@export var dashSpeed=10

var resetJumpWall=true
var resetGravityWall=true

var states : Dictionary = {}
var current_state : State
@export var initial_state : State

#NOTE This is a generic finite_state_machine, it handles all states, changes to this code will affect
	# everything that uses a state machine!

func _ready():
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.Transitioned.connect(change_state) #los states transmiten una señal y aqui me conecto a ella y lo administra el change_state

	if initial_state:
		initial_state.Enter()
		current_state = initial_state

#Call the current states update function continuosly
func _process(delta):
	if current_state:
		current_state.Update(delta)
		


func change_state(source_state : State, new_state_name : String):
	if source_state != current_state:
		#print("Invalid change_state trying from: " + source_state.name + " but currently in: " + current_state.name)
		#This typically only happens when trying to switch from death state following a force_change
		return
	
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		print("New state is empty")
		return
		
	if current_state:
		current_state.Exit()
		
	new_state.Enter()
	
	current_state = new_state

#endregion
