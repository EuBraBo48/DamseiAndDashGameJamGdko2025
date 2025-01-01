extends TextureRect


@export_enum("drop", "drop2") var powerup  = 0

func _get_drag_data(at_position: Vector2) -> Variant:
	var data = [self, powerup]
	visible = false
	var presior =TextureRect.new()
	presior.texture = texture
	set_drag_preview(presior)
	return data

func  _notification(what) -> void:
	match  what:
		NOTIFICATION_DRAG_END:
			visible = true
