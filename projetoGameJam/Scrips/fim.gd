extends Node2D


var PowerOutage : Dictionary =  {
		0: {"dialog": "The lights flickered, and suddenly everything went dark.", 
			"title": "Narrator", 
			"icone": "res://Spreites/icones/descomnhecido.png"
		},
		1: {"dialog": "Dash! The power’s out!",  
			"title": "Damsei", 
			"icone": "res://Spreites/icones/iconeDamsei.png"
		},
		2: {"dialog": "I noticed, Damsei.", 
			"title": "Dash", 
			"icone": "res://Spreites/icones/iconeDash.png"
		},
		3: {"dialog": "What now? What if it never comes back?", 
			"title": "Damsei", 
			"icone": "res://Spreites/icones/iconeDamsei.png"
		},
		4: {"dialog": "Then we’ll live in the Stone Age. Now shut up and help me find the flashlight.", 
			"title": "Dash", 
			"icone": "res://Spreites/icones/iconeDash.png"
		},
		5: {"dialog": "Okay, but... where is it?", 
			"title": "Damsei", 
			"icone": "res://Spreites/icones/iconeDamsei.png"
		},
		6: {"dialog": "If I knew, I’d already have it in my hand, don’t you think?", 
			"title": "Dash", 
			"icone": "res://Spreites/icones/iconeDash.png"
		},
		7: {"dialog": "The sound of things falling and hurried footsteps echoed in the dark.", 
			"title": "Narrator", 
			"icone": "res://Spreites/icones/descomnhecido.png"
		},
		8: {"dialog": "I think I stepped in something wet...", 
			"title": "Damsei", 
			"icone": "res://Spreites/icones/iconeDamsei.png"
		},
		9: {"dialog": "Better not know what it is.", 
			"title": "Dash", 
			"icone": "res://Spreites/icones/iconeDash.png"
		}
}

const _DIALOG_SCREEEN: PackedScene = preload("res://Cenas/Dialog.tscn")

@export_category("Objects")
@export var hud: CanvasLayer

		
func _ready() -> void:
	get_tree().paused = true
	var newDialog: DialogScreen = _DIALOG_SCREEEN.instantiate()
	newDialog._data = PowerOutage
	hud.add_child(newDialog)


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	Gobla.fim = true
	get_tree().change_scene_to_file("res://Cenas/menu.tscn")
