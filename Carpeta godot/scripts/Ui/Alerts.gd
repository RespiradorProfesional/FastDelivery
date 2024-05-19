extends CanvasLayer


@onready var timer=$Timer
@onready var label=$Label

# Called when the node enters the scene tree for the first time.
func _ready():
	visible=false

func show_message(message):
	label.text=message
	visible=true
	timer.start()

func _on_timer_timeout():
	visible=false
