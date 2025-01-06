extends Node2D

const BOLILHA_SUPRESA_MIXCRO = preload("res://Cenas/bolilha_supresa_mixcro.tscn")
@onready var animation: AnimationPlayer = $Animation
@onready var animation_2: AnimationPlayer = $Animation2


@export var title:Label
var infor := 0

@export var butao1: Button
@export var butao2: Button
@export var butao3: Button



func _ready() -> void:
	pass


func _process(delta: float) -> void:
	title.text  = str(infor)
	if infor == 3:
		await  get_tree().create_timer(3).timeout
		Gobla.infor = "go to bed"
		get_tree().paused = false
		get_tree().change_scene_to_file("res://Cenas/casa_pricipal.tscn")


func _on_animation_animation_finished(anim_name: StringName) -> void:
	var bolinh = BOLILHA_SUPRESA_MIXCRO.instantiate()
	var positon = [Vector2(53,148), Vector2(181, 132), Vector2(310,141)].pick_random()
	bolinh.position = positon
	add_child(bolinh)


func _on_button_pressed() -> void:
	animation_2.play("animC1")
	$Label2.text = "I think I'm not there"
	await  get_tree().create_timer(3).timeout
	get_tree().change_scene_to_file("res://Cenas/mini_game_do_microondas_dahs.tscn")

func _on_button_2_pressed() -> void:
	animation_2.play("animC2")
	$Label2.text = "I think I'm not there"
	await  get_tree().create_timer(3).timeout
	get_tree().change_scene_to_file("res://Cenas/mini_game_do_microondas_dahs.tscn")
	
	
func _on_button_3_pressed() -> void:
	animation_2.play("animC3")
	$Label2.text = "I think I'm not there"
	await  get_tree().create_timer(3).timeout
	get_tree().change_scene_to_file("res://Cenas/mini_game_do_microondas_dahs.tscn")
