extends Area2D


# Funçao para verificar o body que entrou, e ativar a animação.
func _on_Area2D_body_entered(body):
	if(body.name == "homer"):		
		#chama a função receber dano
		body.receber_dano()
		#ativa a animação e ao fim desabilita o collision
		$AnimationPlayer.play("ativar_trap")
		#da o play no som
		$AudioStreamPlayer2D.play()
		#define como travado e chama a função que congela o personagem
		body.travado = true
		body.congelar_personagem()
		#pucha o body pro centro da armadilha
		#body.global_position = $".".global_position
