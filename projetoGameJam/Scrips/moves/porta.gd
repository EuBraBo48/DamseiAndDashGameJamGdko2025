extends RigidBody2D
class_name porta


var taNaporta: float = false
const _DIALOG_SCREEEN: PackedScene = preload("res://Cenas/Dialog.tscn")

var TheBathroom: Dictionary = {
	0: {"dialog": "Dash, the bathroom door is locked!", 
		"title": "Damsei", 
		"icone": "res://Spreites/icones/iconeDamsei.png"
	},
	1: {"dialog": "I think our mom forgot to leave it open.", 
		"title": "Dash", 
		"icone": "res://Spreites/icones/iconeDash.png"
	},
	2: {"dialog": "So what do I do?", 
		"title": "Damsei", 
		"icone": "res://Spreites/icones/iconeDamsei.png"
	},
	3: {"dialog": "Avoid drinking too much water for now.", 
		"title": "Dash", 
		"icone": "res://Spreites/icones/iconeDash.png"
	}
}

@export_category("Objects")
@export var hud: CanvasLayer


func _process(delta: float) -> void:
	if taNaporta:
		if Input.is_action_pressed("interagir"):
			get_tree().paused = true
			var newDialog: DialogScreen = _DIALOG_SCREEEN.instantiate()
			newDialog._data = TheBathroom
			taNaporta = false
			hud.add_child(newDialog)


func _on_area_2d_body_entered(body) -> void:
	if body.is_in_group("player"):
		taNaporta = true


func _on_area_2d_body_exited(body) -> void:
	if body.is_in_group("player"):
		taNaporta = false
