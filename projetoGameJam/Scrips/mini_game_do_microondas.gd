extends Control
class_name minigameMicriondas

@onready var particles: CPUParticles2D = $Particles
@export var barraDevidaTextrura: TextureProgressBar 



func _on_texture_button_pressed() -> void:
	var damoAleatorio = [1,2,10,2,4].pick_random()
	barraDevidaTextrura.value -= damoAleatorio
	particles.emitting = true
	$Camera2D.shake_camera(25)
	
	
func _process(delta: float) -> void:
	if barraDevidaTextrura.value <= 0:
		Gobla.infor = "go to your brother"
		get_tree().paused = false
		get_tree().change_scene_to_file("res://Cenas/casa_pricipal.tscn")
		Input.set_custom_mouse_cursor(null)
	
func _ready() -> void:
	var curso = load("res://Spreites/obejtos/mouseDeUnicordio.png")
	Input.set_custom_mouse_cursor(curso)


func _on_timer_timeout() -> void:
	pass # Replace with function body.
