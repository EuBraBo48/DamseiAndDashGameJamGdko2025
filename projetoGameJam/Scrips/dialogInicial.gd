extends Node


const _DIALOG_SCREEEN: PackedScene = preload("res://Cenas/Dialog.tscn")

# 📖 Story Dialogs
var QuietMorning: Dictionary = {
		0: {"dialog": "It was a peaceful morning in the small town where Dash and Damsei lived. The sun shone through the curtains of their shared room, illuminating the crooked posters on the wall and the messy floor filled with toys.", 
			"title": "Narrator", 
			"icone": "res://Spreites/icones/descomnhecido.png"
		},
		1: {"dialog": "Dash! Wake up! Mom and dad already left!", 
			"title": "Damsei", 
			"icone": "res://Spreites/icones/iconeDamsei.png"
		},
		2: {"dialog": "Already? They didn't even say goodbye...", 
			"title": "Dash", 
			"icone": "res://Spreites/icones/iconeDash.png"
		},
		3: {"dialog": "He knew their parents had left in a hurry again, something that had been happening more frequently over the past few months.", 
			"title": "Narrator", 
			"icone": "res://Spreites/icones/descomnhecido.png"
		}
   
}


var NewDay : Dictionary =  {
		0: {"dialog": "The morning sun streamed through the curtain cracks in Dash and Damsei's room. The mess on the floor reflected the rush they had been living in for the past few days.", 
			"title": "Narrator", 
			"icone": "res://Spreites/icones/descomnhecido.png"
		},
		1: {"dialog": "Do you think they'll be back before it gets dark?", 
			"title": "Damsei", 
			"icone": "res://Spreites/icones/iconeDamsei.png"       
			 },
		2: {"dialog": "So what, Damsei? Whether they come back or not, nothing changes. We're always alone.", 
			"title": "Dash", 
			"icone": "res://Spreites/icones/iconeDash.png"
		},
		3: {"dialog": "I just... thought today could be different.", 
			"title": "Damsei", 
			"icone": "res://Spreites/icones/iconeDamsei.png"
		},
		4: {"dialog": "Different how? They come, they leave, and they don’t even look at us! Do you think that’s going to change?", 
			"title": "Dash", 
			"icone": "res://Spreites/icones/iconeDash.png"
		},
		5: {"dialog": "You don’t need to shout...", 
			"title": "Damsei", 
			"icone": "res://Spreites/icones/iconeDamsei.png"
		},
		6: {"dialog": "Look, I’m sorry. It’s just... it’s complicated, okay? Just... give me some time.", 
			"title": "Dash", 
			"icone": "res://Spreites/icones/iconeDash.png"
		},
		7: {"dialog": "Damsei just nodded, going back to fiddling with the rug. The silence that settled in the room was heavy but not unbearable. It was the kind of silence that said more than any words could.", 
			"title": "Narrator", 
			"icone": "res://Spreites/icones/descomnhecido.png"
		}
}


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


@export_category("Objects")
@export var hud: CanvasLayer

func _ready() -> void:
	if Gobla.dia == 1 and Gobla.verd == true:
		get_tree().paused = true
		var newDialog: DialogScreen = _DIALOG_SCREEEN.instantiate()
		newDialog._data = QuietMorning
		hud.add_child(newDialog)
		Gobla.verd = false
		
	if Gobla.dia == 2 and Gobla.verd == true:
		get_tree().paused = true
		var newDialog: DialogScreen = _DIALOG_SCREEEN.instantiate()
		newDialog._data = NewDay
		hud.add_child(newDialog)
		Gobla.verd = false
