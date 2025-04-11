extends Control
class_name Manu

@onready var menu: VBoxContainer = $menu
@onready var opcions: Control = $opcions
@onready var creditos: Control = $creditos
@onready var video: Control = $video
@onready var viddeo: Button = $opcions/opcions/video
@onready var new_game: Button = $"menu/new game"


func _ready() -> void:
	new_game.grab_focus()
	if Gobla.fim == true:
		show_and_hide(creditos, menu)

func _process(delta: float) -> void:
	if visible == false:
		pass
	if visible == true:
		pass
	if Input.is_action_just_pressed("pause"):
		taggle()
		viddeo.grab_focus()


func taggle() -> void:
	visible = !visible
	get_tree().paused = visible
	show_and_hide(opcions,menu)
	


func show_and_hide(first, second ) -> void:
	first.show()
	second.hide()


func _on_opctions_pressed() -> void:
	show_and_hide(opcions,menu)
	viddeo.grab_focus()

func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_back_from_opctions_pressed() -> void:
	show_and_hide(menu, opcions)
	new_game.grab_focus()

func _on_video_pressed() -> void:
	show_and_hide(video, opcions)


func _on_creditos_pressed() -> void:
	show_and_hide(creditos, opcions)


func _on_back_from_v_ido_pressed() -> void:
	show_and_hide(opcions, video)
	viddeo.grab_focus()

func _on_back_from_creditos_pressed() -> void:
	show_and_hide(opcions, creditos)
	viddeo.grab_focus()

func _on_full_screen_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)



func _on_borderless_toggled(toggled_on: bool) -> void:
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, toggled_on)


func _on_new_game_pressed() -> void:
	show_and_hide(opcions,menu)
	get_tree().change_scene_to_file("res://Cenas/casa_pricipal.tscn")
