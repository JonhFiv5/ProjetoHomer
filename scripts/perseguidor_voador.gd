extends KinematicBody2D

var movimento = Vector2(0, 0)
var voo = 0
var velocidade = 100
var direcao = 1
var morto = false
var lado_esquerdo = false
var lado_direito = false
var cima = false
var baixo = false
var vidas = 2
	

func _process(delta):
	#Toda a movimentação só vai funcionar enquanto o inimigo estiver vivo
	if(!morto):
		define_direcao_do_inimigo()
		$AnimationPlayer.play("voando")
		movimento.y = voo
		movimento.x = velocidade * direcao
		move_and_slide(movimento)


#Essa função vai constantemente ler a posição global do inimigo e do player, fazendo ele ir sempre na
#direção do player, o perseguindo
func define_direcao_do_inimigo():
	var posicao_jogador_x = get_parent().get_parent().get_node("player").get_node("homer").global_position.x
	var posicao_inimigo_x = $".".global_position.x 
	if(posicao_jogador_x < posicao_inimigo_x and (posicao_inimigo_x - posicao_jogador_x > 10)):
		lado_direito = false
		lado_esquerdo = true
	elif(posicao_jogador_x > posicao_inimigo_x and (posicao_jogador_x - posicao_inimigo_x > 10)):
		lado_direito = true
		lado_esquerdo = false
	else:
		lado_direito = false
		lado_esquerdo = false
	var posicao_jogador_y = get_parent().get_parent().get_node("player").get_node("homer").global_position.y
	var posicao_inimigo_y = $".".global_position.y
	if(posicao_jogador_y < posicao_inimigo_y and (posicao_inimigo_y - posicao_jogador_y > 3)):
		cima = true
		baixo = false
	elif(posicao_jogador_y > posicao_inimigo_y and (posicao_jogador_y - posicao_inimigo_y > 3)):
		cima = false
		baixo = true
	else:
		cima = false
		baixo = false
	if(cima):
		voo = -50
	elif(baixo):
		voo = 50
	if(!cima and !baixo):
		voo = 0
	if(lado_direito):
		direcao = 1
		velocidade = 100
	elif(lado_esquerdo):
		direcao = -1
		velocidade = 100
	if(!lado_direito and !lado_esquerdo):
		velocidade = 0
	if (direcao == -1):
		$Sprite.flip_h = false
	elif(direcao == 1):
		$Sprite.flip_h = true


#Função ativada quando o inimigo é morto, chamada também em detector.gd
func matar_inimigo():
	morto = true
	movimento = Vector2(0, 0)
	$AnimationPlayer.play("morto")
	$area_dano.queue_free()
	$Timer.start()


#Detecta se atingiu o jogador e invoca a função receber_dano de homer.gd
func _on_area_dano_body_entered(body):
	if(body.name == "homer"):
		body.receber_dano()
		if(body.morto == false):
			$risada_voador.play()
		if(body.morto == true):
			$area_dano.queue_free()


#Temporizador ativado após a morte do inimigo, faz ele sumir da tela após 1.2s
func _on_Timer_timeout():
	$".".hide()
