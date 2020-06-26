extends Node2D


var sair = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if sair and Input.is_action_just_pressed("reiniciar"):
		get_tree().change_scene("res://cenas/menu.tscn")


func _on_Timer_timeout():
	sair = true
	$FimJogo1.visible = false
	$FimJogo2.visible = true
