extends RigidBody2D
class_name televiao

var TheTelevision: Dictionary = {
	0: {"dialog": "Dash! What are you watching?", 
		"title": "Damsei", 
		"icone": "res://Spreites/icones/iconeDamsei.png"
	},
	1: {"dialog": "jezzgosht and cebllet", 
		"title": "Dash", 
		"icone": "res://Spreites/icones/iconeDash.png"
	},
	2: {"dialog": "So how am I going to watch my cartoon?", 
		"title": "Damsei", 
		"icone": "res://Spreites/icones/iconeDamsei.png"
	},
	3: {"dialog": "You’re not. Deal with it and read a book or something.", 
		"title": "Dash", 
		"icone": "res://Spreites/icones/iconeDash.png"
	}
}
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D


var taNaTeleviao: float = false
const _DIALOG_SCREEEN: PackedScene = preload("res://Cenas/Dialog.tscn")

@export_category("Objects")
@export var hud: CanvasLayer


func _process(delta: float) -> void:
	if taNaTeleviao:
		if Input.is_action_pressed("interagir"):
			get_tree().paused = true
			var newDialog: DialogScreen = _DIALOG_SCREEEN.instantiate()
			newDialog._data = TheTelevision
			taNaTeleviao = false
			hud.add_child(newDialog)


func _on_area_2d_body_entered(body) -> void:
	if body.is_in_group("player"):
		taNaTeleviao = true


func _on_area_2d_body_exited(body) -> void:
	if body.is_in_group("player"):
		taNaTeleviao = false
