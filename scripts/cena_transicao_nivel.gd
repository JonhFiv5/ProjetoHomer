extends Node2D



func _ready():
	pass # Replace with function body.


func _process(delta):
	# Ao precisonar enter, reinicia os donuts e atualiza a tela atual
	if(DonutGlobal.tela_atual == 0 and Input.is_action_just_pressed("ui_accept")):
		DonutGlobal.donut = 0
		get_tree().change_scene("res://cenas/menu.tscn")
	if(DonutGlobal.tela_atual == 1 and Input.is_action_just_pressed("ui_accept")):
		DonutGlobal.donut = 0
		get_tree().change_scene("res://cenas/telas/tela2.tscn")
	# Ao precisonar enter, reinicia os donuts e atualiza a tela atual com +1
	if(DonutGlobal.tela_atual == 2 and Input.is_action_just_pressed("ui_accept")):
		DonutGlobal.donut = 0
		get_tree().change_scene("res://cenas/telas/tela3.tscn")
	if(DonutGlobal.tela_atual == 3 and Input.is_action_just_pressed("ui_accept")):
		DonutGlobal.donut = 0
		get_tree().change_scene("res://cenas/telas/tela4.tscn")
	if(DonutGlobal.tela_atual == 4 and Input.is_action_just_pressed("ui_accept")):
		get_tree().change_scene("res://cenas/telas/final.tscn")
