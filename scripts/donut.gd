extends Node2D


func _on_Area2D_body_entered(body):
	# acrescenta a variavel donut no homer +1 a cada vez que entrar no objeto	
	if (body.name == "homer"):
		DonutGlobal.donut +=1
		queue_free()
