extends Node2D

const BOLILHA_SUPRESA_MIXCRO = preload("res://Cenas/bolilha_supresa_mixcro.tscn")

@export var title:Label
var infor := 1

func _ready() -> void:
	var bolinh = BOLILHA_SUPRESA_MIXCRO.instantiate()
	var positon = [Vector2(228,134), Vector2(82, 132), Vector2(393,141)].pick_random()
	bolinh.position = positon
	add_child(bolinh)
	


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	var bolinh = BOLILHA_SUPRESA_MIXCRO.instantiate()
	var positon = [Vector2(228,134), Vector2(82, 132), Vector2(393,141)].pick_random()
	bolinh.position = positon
	add_child(bolinh)


func _process(delta: float) -> void:
	title.text  = str(infor)
