extends TextureRect

@export_enum("banana", "melasia", "maca") var powerup  = 0
@onready var ma_a: TextureRect = $"../../VBoxContainer/maça"
@onready var bg_msuic: AudioStreamPlayer2D = $"../../../../bg_msuic"

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	if data[1] == powerup:
		return true
	return false

func _drop_data(at_position: Vector2, data: Variant) -> void:
	data[0].get_parent().remove_child(data[0])
	add_child(data[0])
	data[0].global_position = global_position
	ma_a.Passarefase += 1
	bg_msuic.play()
	
