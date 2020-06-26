extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	DonutGlobal.tela_atual = 2


func _process(delta):
	#troca para tela de transição, necessario um em cada tela para validação!
	if(DonutGlobal.donut == DonutGlobal.donut_da_tela):
		get_tree().change_scene("res://cenas/cena_transicao_nivel.tscn")
		
