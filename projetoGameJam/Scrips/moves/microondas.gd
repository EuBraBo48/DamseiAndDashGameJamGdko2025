extends RigidBody2D
class_name microondas

var TheMicrowave: Dictionary = {
	0: {"dialog": "The microwave won’t turn on!", 
		"title": "Damsei", 
		"icone": "res://Spreites/icones/iconeDamsei.png"
	},
	1: {"dialog": "Are you sure you didn’t forget to press the right button?", 
		"title": "Dash", 
		"icone": "res://Spreites/icones/iconeDash.png"
	},
	2: {"dialog": "I just wanted to heat up the pizza, but it’s not working!", 
		"title": "Damsei", 
		"icone": "res://Spreites/icones/iconeDamsei.png"
	},
	3: {"dialog": "Seriously, Damsei, the microwave won’t work miracles. Try the stove.", 
		"title": "Dash", 
		"icone": "res://Spreites/icones/iconeDash.png"
		}
}



var taNamicro: float = false
const _DIALOG_SCREEEN: PackedScene = preload("res://Cenas/Dialog.tscn")

@export_category("Objects")
@export var hud: CanvasLayer


func _process(delta: float) -> void:
	if taNamicro:
		if Input.is_action_pressed("interagir") and Gobla.infor == "Go fix microwave"  :
			get_tree().paused = true
			var newDialog: DialogScreen = _DIALOG_SCREEEN.instantiate()
			newDialog._data = TheMicrowave
			taNamicro = false
			hud.add_child(newDialog)
		
		elif  Input.is_action_pressed("interagir") and Gobla.infor == "Go to microwave" and Gobla.dia == 2:
			get_tree().change_scene_to_file("res://Cenas/mini_game_do_microondas.tscn")
		
		
		elif  Input.is_action_pressed("interagir") and Gobla.infor == "Go fix the microwave" and Gobla.dia == 2:
			get_tree().change_scene_to_file("res://Cenas/mini_game_do_microondas_dahs.tscn") 
		

func _on_area_2d_body_entered(body) -> void:
	if body.is_in_group("player"):
		taNamicro = true


func _on_area_2d_body_exited(body) -> void:
	if body.is_in_group("player"):
		taNamicro = false
