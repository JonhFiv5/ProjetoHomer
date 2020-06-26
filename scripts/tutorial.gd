extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	DonutGlobal.tela_atual = 0


func _process(delta):
	#troca para tela de transição, necessario um em cada tela para validação!
	if(DonutGlobal.donut == DonutGlobal.donut_da_tela):
		get_tree().change_scene("res://cenas/cena_transicao_nivel.tscn")


func _on_Sinal1_body_entered(body):
	if body.name == "homer":
		$ControlesPulo.visible = true
		$Sinal1.queue_free()


func _on_Sinal2_body_entered(body):
	if body.name == "homer":
		$ControlesAtaque.visible = true
		$Sinal2.queue_free()


func _on_Sinal3_body_entered(body):
	if body.name == "homer":
		$ControleVidas.visible = true
		$Sinal3.queue_free()


func _on_Sinal4_body_entered(body):
	if body.name == "homer":
		$ControlesCarro.visible = true
		$Sinal4.queue_free()


func _on_Sinal5_body_entered(body):
	if body.name == "homer":
		$ControlesDonut.visible = true
		$Sinal5.queue_free()
