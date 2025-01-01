extends Control
class_name minigameMicriondas


@export var barraDevidaTextrura: ProgressBar 
var barraDevida = 100



func _on_texture_button_pressed() -> void:
	var damoAleatorio = [1,2,10,2,4].pick_random()
	barraDevidaTextrura.value -= damoAleatorio
	barraDevida = barraDevidaTextrura.value
	
	
func _process(delta: float) -> void:
	if barraDevida == 0:
		get_tree().change_scene_to_file("res://Cenas/menu.tscn")
