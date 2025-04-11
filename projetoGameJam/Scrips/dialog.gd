extends Control
class_name DialogScreen

var _speed: float = 0.5

var _id: int = 0
var _data: Dictionary = {}

@export var _name: Label 
@export var _dialog: RichTextLabel
@export var _icone: TextureRect

@export_category("Objects")


func _ready() -> void:
	incieteDialog()
	
	
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_accept") and _dialog.visible_ratio < 1:
		_speed = 0.01
		return
		
	_speed = 0.5
	
	if Input.is_action_just_pressed("ui_accept"):
		_id += 1
		if _id == _data.size():
			get_tree().paused = false
			queue_free()
		incieteDialog()
		
func incieteDialog() -> void:
	if _data.has(_id):
		_name.text = _data[_id]["title"]
		_dialog.text = _data[_id]["dialog"]
		_icone.texture = load(_data[_id]["icone"])
		_dialog.visible_characters = 0
		
		while _dialog.visible_ratio < 1:
			await get_tree().create_timer(_speed).timeout
			_dialog.visible_characters += 1
