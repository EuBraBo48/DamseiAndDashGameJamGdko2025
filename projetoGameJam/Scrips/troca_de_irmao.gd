extends Node2D



var MicrowaveIncident : Dictionary = {
		0: {"dialog": "It was almost lunchtime, and Dash caught a whiff of something burning. Rushing to the kitchen, he found Damsei standing next to the microwave, which was now emitting a thick, gray smoke.", 
			"title": "Narrator", 
			"icone": "res://Spreites/icones/descomnhecido.png"
		},
		1: {"dialog": "Damsei! What did you do this time?!", 
			"title": "Dash", 
			"icone": "res://Spreites/icones/iconeDash.png"
		},
		2: {"dialog": "I just wanted to heat up some pizza... I think I pressed the wrong button.", 
			"title": "Damsei", 
			"icone": "res://Spreites/icones/iconeDamsei.png"
		},
		3: {"dialog": "How did you manage to almost burn the house down with pizza?", 
			"title": "Dash", 
			"icone": "res://Spreites/icones/iconeDash.png"
		},
		4: {"dialog": "I didn't know I couldn't leave the paper in...", 
			"title": "Damsei", 
			"icone": "res://Spreites/icones/iconeDamsei.png"
		},
		5: {"dialog": "New rule: you only use the microwave when I'm around. Got it?", 
			"title": "Dash", 
			"icone": "res://Spreites/icones/iconeDash.png"
		},
		6: {"dialog": "I promise.", 
			"title": "Damsei", 
			"icone": "res://Spreites/icones/iconeDamsei.png"
		},
		7: {"dialog": "They both laughed despite the burnt smell that lingered in the air.", 
			"title": "Narrator", 
			"icone": "res://Spreites/icones/descomnhecido.png"
		}
}


var FridgeAccident : Dictionary =  {
		0: {"dialog": "The day had started off relatively well, but everything changed when Dash walked into the kitchen. The fridge was open, and the floor was covered with spilled milk, broken eggs, and a strange green liquid that Dash didn’t want to know the origin of.", 
			"title": "Narrator", 
			"icone": "res://Spreites/icones/descomnhecido.png"
		},
		1: {"dialog": "Damsei! What did you do?!", 
			"title": "Dash", 
			"icone": "res://Spreites/icones/iconeDash.png"
		},
		2: {"dialog": "I just wanted to get the jelly jar from the top... And then I slipped...", 
			"title": "Damsei", 
			"icone": "res://Spreites/icones/iconeDamsei.png"
		},
		3: {"dialog": "How did you manage to do all this just by trying to get jelly?!", 
			"title": "Dash", 
			"icone": "res://Spreites/icones/iconeDash.png"
		},
		4: {"dialog": "It wasn’t on purpose, Dash! I just... I wanted to surprise you...", 
			"title": "Damsei", 
			"icone": "res://Spreites/icones/iconeDamsei.png"
		},
		5: {"dialog": "Fine, forget it. Go get the mop while I clean up the mess. But next time, ask for help, okay?", 
			"title": "Dash", 
			"icone": "res://Spreites/icones/iconeDash.png"
		},
		6: {"dialog": "Damsei nodded, relieved, as she ran to fetch what Dash had asked for.", 
			"title": "Narrator", 
			"icone": "res://Spreites/icones/descomnhecido.png"
		}
}

const PALYER_DASH = preload("res://Cenas/palyer_dash.tscn")

var Damsei
var taNaarea: float = false
const _DIALOG_SCREEEN: PackedScene = preload("res://Cenas/Dialog.tscn")

@export_category("Objects")
@export var hud: CanvasLayer
@export var _Damsei: damsei

func _ready() -> void:
	if Gobla.Nom == "Dash":
		$BonecoTemplate5.hide()
		$BonecoTemplate13.show()
		_Damsei.queue_free()
		var play = PALYER_DASH.instantiate()
		add_child(play)

func _process(delta: float) -> void:
	if taNaarea:
		if Input.is_action_pressed("interagir") and Gobla.dia == 1 and Gobla.infor == "go to your brother":
			get_tree().paused = true
			var newDialog: DialogScreen = _DIALOG_SCREEEN.instantiate()
			newDialog._data = FridgeAccident
			taNaarea = false
			hud.add_child(newDialog)
			$BonecoTemplate5.hide()
			$BonecoTemplate13.show()
			Damsei.queue_free()
			var play = PALYER_DASH.instantiate()
			add_child(play)
			Gobla.Nom = "Dash"
			Gobla.infor = "Go fix the fridge"
		
		if Input.is_action_pressed("interagir") and Gobla.dia == 2 and Gobla.infor == "go to your brother":
			get_tree().paused = true
			var newDialog: DialogScreen = _DIALOG_SCREEEN.instantiate()
			newDialog._data = MicrowaveIncident
			taNaarea = false
			hud.add_child(newDialog)
			$BonecoTemplate5.hide()
			$BonecoTemplate13.show()
			Damsei.queue_free()
			var play = PALYER_DASH.instantiate()
			add_child(play)
			Gobla.Nom = "Dash"
			Gobla.infor = "Go fix the microwave"
		

func _on_area_2d_body_entered(body) -> void:
	if body.is_in_group("player"):
		taNaarea = true
		Damsei = body

func _on_area_2d_body_exited(body) -> void:
	if body.is_in_group("player"):
		taNaarea = false
		Damsei = null
