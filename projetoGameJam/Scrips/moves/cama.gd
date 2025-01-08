extends RigidBody2D
class_name cama


var TheBed: Dictionary = {
	0: {"dialog": "Dash, my bed feels weird without the lights.", 
		"title": "Damsei", 
		"icone": "res://Spreites/icones/iconeDamsei.png"
	},
	1: {"dialog": "Damsei, it’s just a bed. It’s the same as before.", 
		"title": "Dash", 
		"icone": "res://Spreites/icones/iconeDash.png"
	},
	2: {"dialog": "But it feels like there’s something under it...", 
		"title": "Damsei", 
		"icone": "res://Spreites/icones/iconeDamsei.png"
	},
	3: {"dialog": "Do you want me to look or are you going to sleep on the couch?", 
		"title": "Dash", 
		"icone": "res://Spreites/icones/iconeDash.png"
	}
}

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

var taNacama: float = false
const _DIALOG_SCREEEN: PackedScene = preload("res://Cenas/Dialog.tscn")

@export_category("Objects")
@export var hud: CanvasLayer


func _process(delta: float) -> void:
	if taNacama:
		if Input.is_action_pressed("interagir") and Gobla.infor == "Go to the frinde":
			get_tree().paused = true
			var newDialog: DialogScreen = _DIALOG_SCREEEN.instantiate()
			newDialog._data = TheBed
			taNacama = false
			Gobla.Nom = "Damsei"
			hud.add_child(newDialog)
			
		if Input.is_action_pressed("interagir") and Gobla.infor == "go to bed" and Gobla.dia == 1:
			Gobla.verd = true
			$"../../../AnimationPlayer".play("dormin")
			
		if Input.is_action_pressed("interagir") and Gobla.infor == "go to bed" and Gobla.dia == 2:
			Gobla.verd = true
			$"../../../ColorRect".visible = true
			await  get_tree().create_timer(4).timeout
			get_tree().change_scene_to_file("res://Cenas/fim.tscn")

		
	
	
		


func _on_area_2d_body_entered(body) -> void:
	if body.is_in_group("player"):
		taNacama = true


func _on_area_2d_body_exited(body) -> void:
	if body.is_in_group("player"):
		taNacama = false


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if Gobla.dia == 1:
		Gobla.dia = 2
		Gobla.infor = "Go to microwave"
		Gobla.Nom = "Damsei"
		get_tree().paused = false
		audio_stream_player_2d.play()
		await get_tree().create_timer(2.51).timeout
		get_tree().change_scene_to_file("res://Cenas/casa_pricipal.tscn")
	
