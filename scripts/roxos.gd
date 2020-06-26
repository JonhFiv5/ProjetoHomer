extends Node2D
#Script responsável pelos comandos que movimentam o elemento do grupo roxo

var deslocamento = 20
var rotacao = 30
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


func _on_elemento_body_entered(body):
	print(body.name)
	if(body.name != "homer" and body.name != "Perseguidor" and body.name != "inimigo" and body.name != "elemento"):
		$elemento.position.x = posicao_original_x
		$elemento.position.y = posicao_original_y
		$elemento.rotation_degrees = posicao_original_rotacao


func _on_AreaCamera_body_entered(body):
	if(body.name == "homer"):
		#body.get_node("Camera2D").smoothing_enabled = true
		body.get_node("Camera2D").position.y -= 100
		body.get_node("vida1").position.y -= 100
		body.get_node("vida2").position.y -= 100
		body.get_node("vida3").position.y -= 100
		body.get_node("NodePausa").position.y -= 100

func _on_AreaCamera_body_exited(body):
	if(body.name == "homer"):
		#body.get_node("Camera2D").smoothing_enabled = false
		body.get_node("Camera2D").position.y += 100
		body.get_node("vida1").position.y += 100
		body.get_node("vida2").position.y += 100
		body.get_node("vida3").position.y += 100
		body.get_node("NodePausa").position.y += 100

func _on_chave_body_entered(body):
	if(body.name == "elemento"):
		$bloqueio/SpriteAtivado.hide()
		$bloqueio/SpriteDesativado.show()
		$bloqueio/CollisionShape2D.queue_free()
		$chave.queue_free()
