extends TextureRect

@export_enum("drop", "drop2")
var powerup = 0

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
		# Restaura a visibilidade do objeto original
		visible = true
		Passarefase += 1
		print(Passarefase)


func _process(delta: float) -> void:
	if Passarefase == 2:
		get_tree().change_scene_to_file("res://Cenas/menu.tscn")
