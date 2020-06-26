extends Node2D


var pausado = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(pausado):
		get_tree().paused = true
		$PausadoSprite.visible = true
	else:
		$PausadoSprite.visible = false
		get_tree().paused = false
	#if(get_tree().paused == true):
	#	$".".show()
	#else:
	#	$".".hide()


func _on_Button_pause_pressed():
	pausado = true


func _on_Button_play_pressed():
	pausado = false


func _on_Button_exit_pressed():
	# pausado = false
	if pausado == false:
		get_tree().change_scene("res://cenas/menu.tscn")
