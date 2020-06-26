extends Area2D

#Script que irá controlar os disparos do jogador
const VELOCIDADE = 400
var movimento = Vector2()
var direcao = 1 #1 representa direita e -1 esquerda

func _ready():
	pass


#Irá alterar a direção do tiro, essa função é chamada em homer.gd, no momento do
#disparo.
func define_direcao_do_tiro(dir):
	direcao = dir #Seta a direção recebida como argumento
	#Inverte o sprite do disparo
	if dir == -1:
		$Sprite.flip_h = true
	else:
		$Sprite.flip_h = false


#Movimenta o disparo com a velocidade definida e na direção indicada pela
#função define_direcao_do_tiro(dir)
func _physics_process(delta):
	movimento.x = VELOCIDADE * delta * direcao
	translate(movimento)


#Remove o disparo do jogo no momento em que ele sai da área visível da tela
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


#Detecta se atingiu um inimigo terrestre
func _on_detector_body_entered(body):
	if(body.name == "inimigo" or body.name == "Perseguidor"):
		body.matar_inimigo()
	queue_free()


#Detecta se atingiu um dos inimigos voadores, já que eles não têm body
func _on_detector_area_entered(area):
	if(area.get_parent().name == "Perseguidor_voador"):
		area.get_parent().vidas -=1
		if(area.get_parent().vidas <= 0):
			area.get_parent().matar_inimigo()
		queue_free()
