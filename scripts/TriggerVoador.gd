extends Area2D



func _on_TriggerVoador_body_entered(body):
	print(body.name)
	if(body.name == "homer" or body.name == "elemento"):
		var cena_perseguidor = preload("res://cenas/perseguidor_voador.tscn")
		var perseguidor_voador = cena_perseguidor.instance()
		perseguidor_voador.global_position = $OrigemVoador.global_position
		get_parent().add_child(perseguidor_voador)
		queue_free()
