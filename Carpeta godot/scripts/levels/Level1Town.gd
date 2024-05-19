extends Level_Template

#Script para la escena del nivel 1, solo es usada para manejar cuando el jugador
#sale del mapa, al salirse aparece en un lugar especificado 

@onready var firtsRespawn = $FirtsRespawn
@onready var secondRespawn = $SecondRespawn

func _on_firts_fall_body_entered(body):
	if body is Player :
		body.global_position=firtsRespawn.global_position


func _on_second_fall_body_entered(body):
	if body is Player :
		body.global_position=secondRespawn.global_position
