extends Node2D

func _ready():
	$Passagem2/Sprite.hide()
	DonutGlobal.tela_atual = 1


func _process(delta):
	#troca para tela de transição, necessario um em cada tela para validação!
	if(DonutGlobal.donut == DonutGlobal.donut_da_tela):
		get_tree().change_scene("res://cenas/cena_transicao_nivel.tscn")
		

func _on_aumenta_y_body_entered(body):
	if(body.name == "player"):
		$elemento.postition.y -= 50


func _on_Area2D_body_exited(body):
	if(body.name == "homer"):
		$Passagem2/Sprite.show()
