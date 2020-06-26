extends KinematicBody2D

const CHAO = Vector2(0, -1)
var movimento = Vector2(0, 0)
var velocidade = 200
var GRAVIDADE = 20
var direcao = 1
var morto = false
var lado_esquerdo = false
var lado_direito = false
var parede = Vector2(0, 0)


func _process(delta):
	#Toda a movimentação só vai funcionar enquanto o inimigo estiver vivo
	if(!morto):
		define_direcao_do_inimigo()
		define_animacao()
		movimento.x = velocidade * direcao
		movimento.y += GRAVIDADE
		movimento.y = move_and_slide(movimento, CHAO).y
		

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
	if(lado_direito):
		velocidade = 200
		direcao = 1
	elif(lado_esquerdo):
		velocidade = 200
		direcao = -1
	if(!lado_direito && !lado_esquerdo):
		velocidade = 0
		$AnimationPlayer.play("parado")
	if (direcao == -1):
		$Sprite.flip_h = true
	elif(direcao == 1):
		$Sprite.flip_h = false


#Função ativada quando o inimigo é morto, chamada também em detector.gd
func matar_inimigo():
	morto = true
	movimento = Vector2(0, 0)
	$AnimationPlayer.play("morto")
	$CollisionShape2D.queue_free()
	$area_dano.queue_free()
	$area_morte.queue_free()
	$Timer.start()


#Detecta se atingiu o jogador e invoca a função receber_dano de homer.gd
func _on_area_dano_body_entered(body):
	if(body.name == "homer"):
		body.receber_dano()
		if(body.morto == false):
			$bart_perseguidor.play()
		if(body.morto == true):
			GRAVIDADE = 0
			$CollisionShape2D.queue_free()
			$area_dano.queue_free()
			$area_morte.queue_free()


#Essa função organiza as animações, sendo responsável por alterar entre a animação
# de andando e parado, detectando se o inimigo está se movendo ou não
func define_animacao():
	if((velocidade > 0) and !is_on_wall()):
		$AnimationPlayer.play("andando")
	if(is_on_wall()):
		$AnimationPlayer.play("parado")

#Temporizador ativado após a morte do inimigo, faz ele sumir da tela após 2s
func _on_Timer_timeout():
	$".".hide()


#Detector que mata o inimigo caso o jogador caia em cima dele
func _on_area_morte_body_entered(body):
	if(body.name == "homer" && !body.morto):
		matar_inimigo()
