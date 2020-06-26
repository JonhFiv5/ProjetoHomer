extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	DonutGlobal.donut = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	get_tree().change_scene("res://cenas/telas/tela1.tscn")


func _on_Button_tutorial_pressed():
	get_tree().change_scene("res://cenas/telas/tutorial.tscn")
