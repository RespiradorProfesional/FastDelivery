extends CanvasLayer

#Se usa para mostrar mensajes momentaneos 

@onready var timer=$Timer
@onready var label=$Label

func _ready():
	visible=false


#Para mostrar un mensaje se usa este metodo pasando por parametro el mensaje a 
#emitir
func show_message(message):
	label.text=message
	visible=true
	timer.start()

func _on_timer_timeout():
	visible=false
