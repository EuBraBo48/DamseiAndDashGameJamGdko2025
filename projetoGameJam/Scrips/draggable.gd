extends TextureRect

@export_enum("banana", "melasia", "maca")
var powerup = 0
@onready var bg_msuic_2: AudioStreamPlayer2D = $"../../../../bg_msuic2"
var Passarefase:= 0 


func _get_drag_data(at_position: Vector2) -> Variant:
	# Dados para o arrasto
	var data = [self, powerup]
	visible = false
	# Criar o preview do objeto
	var presior = TextureRect.new()
	presior.texture = texture
	# Centraliza no mouse
	var mouse_position = get_global_mouse_position() - position
	position = get_global_mouse_position() - mouse_position
	# Adiciona o preview à cena
	set_drag_preview(presior)
	
	return data

func _notification(what: int) -> void:
	if what == NOTIFICATION_DRAG_END:
		visible = true
		


func _process(delta: float) -> void:
	if Passarefase == 3:
		Gobla.infor = "go to bed"
		get_tree().paused = false
		bg_msuic_2.play()
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("res://Cenas/casa_pricipal.tscn")
