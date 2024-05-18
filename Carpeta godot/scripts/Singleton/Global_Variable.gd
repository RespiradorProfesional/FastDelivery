extends Node

var urlBaseApi= "http://127.0.0.1:5000"

var blend_pos_paths = [
	"parameters/Idle/blend_position",
	"parameters/Jump/blend_position",
	"parameters/Running/blend_position",
	"parameters/Jump/blend_position",
	"parameters/Fall/blend_position",
	"parameters/Bend/blend_position",
	"parameters/InWall/blend_position",
	"parameters/WallJump/blend_position",
	"parameters/Slide/blend_position",
	"parameters/BendJump/blend_position"
]

var score=0
var isChatting=true
var userId=0
var userName=""
var userPassw=""
