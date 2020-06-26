extends Node2D

func _ready():
	pass


func _process(delta):
	#Reinicia o jogo após apertar enter
	if(Input.is_action_just_pressed("reiniciar")):
		DonutGlobal.donut = 0
		if(DonutGlobal.tela_atual == 1):
			get_tree().change_scene("res://cenas/telas/tela1.tscn")
		elif(DonutGlobal.tela_atual == 2):
			get_tree().change_scene("res://cenas/telas/tela2.tscn")
		elif(DonutGlobal.tela_atual == 3):
			get_tree().change_scene("res://cenas/telas/tela3.tscn")
		elif(DonutGlobal.tela_atual == 4):
			get_tree().change_scene("res://cenas/telas/tela4.tscn")
		elif(DonutGlobal.tela_atual == 0):
			get_tree().change_scene("res://cenas/telas/tutorial.tscn")
