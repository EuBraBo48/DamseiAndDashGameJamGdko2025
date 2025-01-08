extends Sprite2D

@onready var bg_msuic_2: AudioStreamPlayer2D = $bg_msuic2


func _ready() -> void:
	if position == Vector2(53,148):
		get_parent().butao1.hide()
	elif  position == Vector2(181, 132):
		get_parent().butao2.hide()
	elif  position == Vector2(310,141):
		get_parent().butao3.hide()

func _on_button_pressed() -> void:
	if position == Vector2(53,148):
		get_parent().animation_2.play("animC1")
		bg_msuic_2.play()
		
	elif  position == Vector2(181, 132):
		get_parent().animation_2.play("animC2")
		bg_msuic_2.play()
	elif  position == Vector2(310,141):
		get_parent().animation_2.play("animC3")
		bg_msuic_2.play()
	
	get_parent().infor += 1
	await get_tree().create_timer(1.6).timeout
	queue_free()
	get_parent().animation.play("inic")
	
	get_parent().butao1.show()
	get_parent().butao2.show()
	get_parent().butao3.show()
	
