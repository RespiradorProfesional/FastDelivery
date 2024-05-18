extends Node
class_name FiniteStateMachine

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

var lastDirection=1

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
	
	if (lastDirection!=0):
		for path in GlobalVariable.blend_pos_paths:
			animation_Tree.set(path, lastDirection)
	
	


func change_state(source_state : State, new_state_name : String):
	
	if !GlobalVariable.isChatting:
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
		animation_change(new_state_name.to_lower())

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



