extends KinematicBody2D

const CHAO = Vector2(0, -1)
var movimento = Vector2(0, 0)
const VELOCIDADE = 300
var GRAVIDADE = 20
var direcao = 1
var morto = false


func _process(delta):
	define_direcao_do_inimigo()
	#Toda a movimentação só vai funcionar enquanto o inimigo estiver vivo
	if(!morto):
		$AnimationPlayer.play("andando")
		movimento.y += GRAVIDADE
		movimento.x = VELOCIDADE * direcao
		movimento.y = move_and_slide(movimento, CHAO).y


#Essa função vai inverter a movimentação, sprite e raycast do inimigo toda
#vez que ele colidir com algo ou atingir a borda da plataforma
func define_direcao_do_inimigo():
	if(is_on_wall()):
		direcao *= -1
		$RayCast2D.position.x *= -1
	if($RayCast2D.is_colliding() == false):
		direcao *= -1
		$RayCast2D.position.x *= -1
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
			$risada.play()
		if(body.morto == true):
			GRAVIDADE = 0
			$CollisionShape2D.queue_free()
			$area_dano.queue_free()
			$area_morte.queue_free()
			
		


#Temporizador ativado após a morte do inimigo, faz ele sumir da tela após 2s
func _on_Timer_timeout():
	queue_free()


#Detector que mata o inimigo caso o jogador caia em cima dele
func _on_area_morte_body_entered(body):
	if(body.name == "homer" && !body.morto):
		matar_inimigo()
