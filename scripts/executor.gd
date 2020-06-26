extends Area2D

#Movimentação do executor
func _process(delta):
	translate(Vector2(-15, 0))


#Mata o personagem no momento em que o toca
func _on_executor_body_entered(body):
	if(body.name == "homer"):
		body.matar_personagem()
		get_parent().get_node("Game Over").visible = true
