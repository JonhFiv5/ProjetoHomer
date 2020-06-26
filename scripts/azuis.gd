extends Node2D
#Script responsável pelos comandos que movimentam o elemento do grupo azul

var deslocamento = 40
var rotacao = 90
var posicao_original_x = 0
var posicao_original_y = 0
var posicao_original_rotacao = 0

func _ready():
	posicao_original_x = $elemento.position.x
	posicao_original_y = $elemento.position.y
	posicao_original_rotacao = $elemento.rotation_degrees

#Vai mover o elemento para a direita
func _on_aumenta_x_body_entered(body):
	if(body.name == "homer"):
		$elemento.position.x += deslocamento


#Vai mover o elemento para a esquerda
func _on_reduz_x_body_entered(body):
	if(body.name == "homer"):
		$elemento.position.x -= deslocamento


#Vai mover o elemento para cima
func _on_aumenta_y_body_entered(body):
	if(body.name == "homer"):
		$elemento.position.y -= deslocamento

#Vai mover o elemento para baixo
func _on_reduz_y_body_entered(body):
	if(body.name == "homer"):
		$elemento.position.y += deslocamento
#Vai girar o elemento em sentido horário
func _on_aumenta_angulo_body_entered(body):
	if(body.name == "homer"):
		$elemento.rotation_degrees += rotacao


#Vai girar o elemento em sentido anti-horário
func _on_reduz_angulo_body_entered(body):
	if(body.name == "homer"):
		$elemento.rotation_degrees -= rotacao


#Retorna o elemento para a posição original se tocar no mapa
func _on_elemento_body_entered(body):
	if(body.name != "homer" and body.name != "Perseguidor" and body.name != "inimigo"):
		$elemento.position.x = posicao_original_x
		$elemento.position.y = posicao_original_y
		$elemento.rotation_degrees -= posicao_original_rotacao
		
