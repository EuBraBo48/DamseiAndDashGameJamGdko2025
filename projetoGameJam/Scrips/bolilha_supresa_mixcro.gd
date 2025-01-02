extends Sprite2D




func _on_button_pressed() -> void:
	get_parent().infor += 1
	queue_free()
	#animação
	#almenta o velo
	#
