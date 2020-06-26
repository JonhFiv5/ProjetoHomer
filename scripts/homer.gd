extends KinematicBody2D

const CHAO = Vector2(0, -1)
var movimento = Vector2(0, 0)
var VELOCIDADE = 300
const ALTURA_PULO = -650
const GRAVIDADE = 20
var atacando = false
var vidas = 3
var morto = false
var pulando = false
var travado = false


func _physics_process(delta):
	if(travado):
		VELOCIDADE = 0
	else:
		VELOCIDADE = 300
	movimento.y += GRAVIDADE #Aplica gravidade
	if !morto:
		movimentar() #Define a movimentação do personagem
	animacao_ataque() #Evita a sobreposição de animações
	movimento.y = move_and_slide(movimento, CHAO).y #Executa a movimentação do personagem
	
	#Faz a variavel donut aparecer na tela em ordem decrescente
	$RichTextLabel.set_text(str((0 + DonutGlobal.donut_da_tela) - (0 + DonutGlobal.donut)))

#Controla toda a movimentação do personagem
func movimentar():
	#Movimenta o personagem e o Position2D para a direita
	if(Input.is_action_pressed("ui_right") && !atacando):
		if($origem_tiro.position.x < 0):
			$origem_tiro.position.x = $origem_tiro.position.x * -1
		$Sprite.flip_h = false
		#bloqueia o movimento se estiver travado
		if(is_on_floor() and not travado):
			$AnimationPlayer.play("andando")
		movimento.x = VELOCIDADE

	
	#Movimenta o personagem e o Position2D para a esquerda
	elif(Input.is_action_pressed("ui_left") && !atacando):
		if($origem_tiro.position.x > 0):
			$origem_tiro.position.x = $origem_tiro.position.x * -1
		$Sprite.flip_h = true
		#bloqueia o movimento se estiver travado
		if(is_on_floor() and not travado):
			$AnimationPlayer.play("andando")
		movimento.x = -VELOCIDADE

	
	#Faz o personagem parar de se mover quando não estiver andando
	else:
		movimento.x = 0
		if(is_on_floor() && !atacando):
			$AnimationPlayer.play("parado")

	if(is_on_floor()):
		pulando = false
	#Faz o personagem pular
	#bloqueia o movimento se estiver travado
	if(Input.is_action_just_pressed("ui_up") && is_on_floor() && !atacando and not travado):
		$AnimationPlayer.play("pulando")
		pulando = true
		movimento.y = ALTURA_PULO
		

	#Define a animação de pulo para quando estiver caindo
	if(!is_on_floor() and !pulando):
		#movimento.x = 0
		$AnimationPlayer.play("pulando")

	
	#Faz o personagem atacar
	if(Input.is_action_just_pressed("estilingue") && !atacando):
		$estilingue.play()
		if(is_on_floor()):
			$AnimationPlayer.play("ataque_estilingue")
		else:
			$AnimationPlayer.play("ataque_estilingue_pulando")
		var cena_disparo = preload("res://cenas/disparo.tscn")
		var objeto_disparo = cena_disparo.instance()
		#Define a direção para onde o tiro deve ir
		if sign($origem_tiro.position.x) > 0:
			objeto_disparo.get_node("detector").define_direcao_do_tiro(1)
		else:
			objeto_disparo.get_node("detector").define_direcao_do_tiro(-1)
		objeto_disparo.global_position = $origem_tiro.global_position
		get_tree().root.add_child(objeto_disparo)
		
		
#Captura se uma animação de ataque está sendo executada
func animacao_ataque():
	var animacao = $AnimationPlayer.get_current_animation()
	if(animacao == "ataque_estilingue"):
		atacando = true
	else:
		atacando = false

#Função para congelar o personagem e executar a animação de parado e morto
func congelar_personagem():
	if(travado and not morto):
		$Timer_travado.start()
		$AnimationPlayer.play("parado")


#Função chamada sempre que o jogador sofre dano
func receber_dano():
	$AnimationPlayerDano.play("levando_dano")
	vidas -= 1
	if(not morto):
		$grito.play()
	if(vidas == 0):
		$vida1.visible = false
		matar_personagem()
		$Timer.start()
	elif(vidas == 2):
		$vida3.visible = false
	elif(vidas == 1):
		$vida2.visible = false


#Função invocada ao encostar no executor ou zerar as vidas
func matar_personagem():
	morto = true
	$Sprite.flip_h = !$Sprite.flip_h
	$AnimationPlayer.play("morrendo")
	movimento.x = 0

#Timer executado ao zerar as vidas, passando para a tela de game over
func _on_Timer_timeout():
	get_tree().change_scene("res://cenas/game_over.tscn")


func _on_Timer_travado_timeout():
	travado = false
