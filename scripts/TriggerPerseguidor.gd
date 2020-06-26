extends Area2D



func _on_TriggerPerseguidor_body_entered(body):
	if(body.name == "homer" or body.name == "elemento"):
		var cena_perseguidor = preload("res://cenas/perseguidor.tscn")
		var perseguidor = cena_perseguidor.instance()
		perseguidor.global_position = $OrigemPerseguidor.global_position
		get_parent().add_child(perseguidor)
		queue_free()
