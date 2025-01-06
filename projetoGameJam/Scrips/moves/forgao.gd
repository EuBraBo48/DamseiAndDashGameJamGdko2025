extends RigidBody2D
class_name fogao


var TheStove: Dictionary = {
	0: {"dialog": "Dash, the stove isn’t working!", 
		"title": "Damsei", 
		"icone": "res://Spreites/icones/iconeDamsei.png"
	},
	1: {"dialog": "I think you didn’t turn the knob right, Damsei.", 
		"title": "Dash", 
		"icone": "res://Spreites/icones/iconeDash.png"
	},
	2: {"dialog": "I turned it, but it didn’t light up!", 
		"title": "Damsei", 
		"icone": "res://Spreites/icones/iconeDamsei.png"
	},
	3: {"dialog": "Then you’ll learn to cook on low heat. It’ll be safer.", 
		"title": "Dash", 
		"icone": "res://Spreites/icones/iconeDash.png"
	}
}

var taNafogao: float = false
const _DIALOG_SCREEEN: PackedScene = preload("res://Cenas/Dialog.tscn")

@export_category("Objects")
@export var hud: CanvasLayer


func _process(delta: float) -> void:
	if taNafogao:
		if Input.is_action_pressed("interagir"):
			get_tree().paused = true
			var newDialog: DialogScreen = _DIALOG_SCREEEN.instantiate()
			newDialog._data = TheStove
			taNafogao = false
			hud.add_child(newDialog)


func _on_area_2d_body_entered(body) -> void:
	if body.is_in_group("player"):
		taNafogao = true


func _on_area_2d_body_exited(body) -> void:
	if body.is_in_group("player"):
		taNafogao = false
