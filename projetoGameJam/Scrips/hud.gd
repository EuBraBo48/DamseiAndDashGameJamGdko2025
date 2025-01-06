extends Control
class_name hud

@export var infor_mision: Label 
@export var _name: Label 
@export var icone: TextureRect
@export var numddi: Label 


func _process(delta: float) -> void:
	infor_mision.text = "mission:"+" "+Gobla.infor
	numddi.text = str(Gobla.dia)
	if Gobla.infor == "Go to the fridge" and Gobla.dia == 1:
		_name.text = "Damsei"
		icone.texture = load("res://Spreites/icones/iconeDamsei.png")
	
	elif Gobla.infor == "go to your brother" and Gobla.dia >= 1:
		_name.text = "Damsei"
		icone.texture = load("res://Spreites/icones/iconeDamsei.png")
		
	elif Gobla.infor == "Go fix the fridge" and Gobla.dia == 1:
		_name.text = "Dash"
		icone.texture = load("res://Spreites/icones/iconeDash.png")
	
	elif  Gobla.infor == "Go to microwave" and Gobla.dia == 2:
		_name.text = "Damsei"
		icone.texture = load("res://Spreites/icones/iconeDamsei.png")
	
	elif  Gobla.infor == "Go fix the microwave" and Gobla.dia == 2:
		_name.text = "Dash"
		icone.texture = load("res://Spreites/icones/iconeDash.png")
	
	
	elif  Gobla.infor == "go to bed" and Gobla.dia >= 1:
		_name.text = "Dash"
		icone.texture = load("res://Spreites/icones/iconeDash.png")
		
