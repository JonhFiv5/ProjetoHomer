extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	DonutGlobal.tela_atual = 4

func _process(delta):
	#troca para tela de transição, necessario um em cada tela para validação!
	if(DonutGlobal.donut == DonutGlobal.donut_da_tela):
		get_tree().change_scene("res://cenas/cena_transicao_nivel.tscn")

#inicia a plataforma
func _on_Area2D_body_entered(body):	
	if(body.name == "homer"):
		$AnimationPlayer.play("andamento")

#validadores de rosquinhas
func _on_validador1_body_entered(body):
	if(body.name == "homer"):
		if(DonutGlobal.donut < 1):
			get_tree().change_scene("res://cenas/game_over.tscn")
		
func _on_validador2_body_entered(body):
	if(body.name == "homer"):
		if(DonutGlobal.donut < 2):
			get_tree().change_scene("res://cenas/game_over.tscn")

func _on_validador3_body_entered(body):
	if(body.name == "homer"):
		if(DonutGlobal.donut < 3):
			get_tree().change_scene("res://cenas/game_over.tscn")
func _on_validador4_body_entered(body):
	if(body.name == "homer"):
		if(DonutGlobal.donut < 4):
			get_tree().change_scene("res://cenas/game_over.tscn")
func _on_validador5_body_entered(body):
	if(body.name == "homer"):
		if(DonutGlobal.donut < 5):
			get_tree().change_scene("res://cenas/game_over.tscn")
