extends RigidBody2D
class_name geladeira



var TheFridge: Dictionary = {
	0: {"dialog": "Dash, the fridge isn’t closing properly!", 
		"title": "Damsei", 
		"icone": "res://Spreites/icones/iconeDamsei.png"
	},
	1: {"dialog": "It looks like you’re just putting things in any old way, Damsei.", 
		"title": "Dash", 
		"icone": "res://Spreites/icones/iconeDash.png"
	},
	2: {"dialog": "There’s no room for anything!", 
		"title": "Damsei", 
		"icone": "res://Spreites/icones/iconeDamsei.png"
	},
	3: {"dialog": "Then organize it properly or you’ll have to live without a fridge.", 
		"title": "Dash", 
		"icone": "res://Spreites/icones/iconeDash.png"
	}
}


var taNageladeira: float = false
const _DIALOG_SCREEEN: PackedScene = preload("res://Cenas/Dialog.tscn")

@export_category("Objects")
@export var hud: CanvasLayer


func _process(delta: float) -> void:
	if taNageladeira:
		if Input.is_action_pressed("interagir") and Gobla.infor != "Go to the fridge":
			get_tree().paused = true
			var newDialog: DialogScreen = _DIALOG_SCREEEN.instantiate()
			newDialog._data = TheFridge
			taNageladeira = false
			hud.add_child(newDialog)
		
		if  Input.is_action_pressed("interagir") and Gobla.infor == "Go to the fridge" and Gobla.dia == 1:
			get_tree().change_scene_to_file("res://Cenas/minigame_do_Geladeira.tscn")
		
		
		if  Input.is_action_pressed("interagir") and Gobla.infor == "Go fix the fridge" and Gobla.dia == 1:
			get_tree().change_scene_to_file("res://Cenas/miniGameDoIDashGeladeira.tscn")	
		
		


func _on_area_2d_body_entered(body) -> void:
	if body.is_in_group("player"):
		taNageladeira = true


func _on_area_2d_body_exited(body) -> void:
	if body.is_in_group("player"):
		taNageladeira = false
