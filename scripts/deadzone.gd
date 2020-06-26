extends Area2D


#Executa a deadzone, area2d que fica embaixo das fases
func _on_deadzone_body_entered(body):
	if(body.name == "homer"):
		get_tree().change_scene("res://cenas/game_over.tscn")
