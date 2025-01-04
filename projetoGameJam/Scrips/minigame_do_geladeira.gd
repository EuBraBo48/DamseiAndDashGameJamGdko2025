extends Node2D
class_name minigameDaGeladeira

@export var trilha_1: PathFollow2D 
@export var titulo: Label 


var letraAleatoria: String = ""
var letrasSotiadas: Array =  ["a", "b", "c", "d", "e", "f", "g"]
var texto:String = ""


func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_echo() == false and event.is_pressed():
		var letra = OS.get_keycode_string(event.keycode)
		var alfabeto = "abcdefghijklmnopqrstuvwxyz"
		if letra.to_lower() in alfabeto:
			#print(letra)
			tecla(letra.to_lower())
			texto = texto + letra 

func tecla(letra) -> void:
	if letra == letraAleatoria:
		trilha_1.progress_ratio += 0.024
		letraAleatoria = letrasSotiadas.pick_random()
		titulo.text = (letraAleatoria.to_upper())
		await get_tree().create_timer(1).timeout
		
	if 	trilha_1.progress_ratio == 1:
		await get_tree().create_timer(0.1).timeout
		get_tree().change_scene_to_file("res://Cenas/menu.tscn")
		

func _ready() -> void:
	letraAleatoria = letrasSotiadas.pick_random()
	titulo.text = (letraAleatoria.to_upper())
