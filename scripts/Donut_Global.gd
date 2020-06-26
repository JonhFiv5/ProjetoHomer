extends Node

# variaveis de validação (Não alterar)
var donut = 0
var tela_atual = 0
var donut_da_tela = 0

# Donuts das telas (Configurar de acordo com a tela)
var donut_tela0 = 7 #tutorial
var donut_tela1 = 2
var donut_tela2 = 10
var donut_tela3 = 10
var donut_tela4 = 5

func _ready():
	pass # Replace with function body.

#atualiza na tela a quantidade de donuts que precisam na tela
func _process(delta):
	if(tela_atual == 0):
		donut_da_tela = donut_tela0
	if(tela_atual == 1):
		donut_da_tela = donut_tela1
	if(tela_atual == 2):
		donut_da_tela = donut_tela2
	if(tela_atual == 3):
		donut_da_tela = donut_tela3
	if(tela_atual == 4):
		donut_da_tela = donut_tela4
