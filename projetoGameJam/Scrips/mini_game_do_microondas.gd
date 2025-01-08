extends Control
class_name minigameMicriondas

@onready var particles: CPUParticles2D = $Particles
@export var barraDevidaTextrura: TextureProgressBar 
@onready var bg_msuic_3: AudioStreamPlayer2D = $bg_msuic3
@onready var bg_msuic_2: AudioStreamPlayer2D = $bg_msuic2



func _on_texture_button_pressed() -> void:
	var damoAleatorio = [1,2,10,2,4].pick_random()
	barraDevidaTextrura.value -= damoAleatorio
	particles.emitting = true
	bg_msuic_2.play()
	$Camera2D.shake_camera(25)
	
	
func _process(delta: float) -> void:
	if barraDevidaTextrura.value <= 0:
		bg_msuic_3.play()
		await get_tree().create_timer(1).timeout
		Gobla.infor = "go to your brother"
		get_tree().paused = false
		get_tree().change_scene_to_file("res://Cenas/casa_pricipal.tscn")
		Input.set_custom_mouse_cursor(null)
	
func _ready() -> void:
	var curso = load("res://Spreites/obejtos/mouseDeUnicordio.png")
	Input.set_custom_mouse_cursor(curso)


func _on_timer_timeout() -> void:
	pass # Replace with function body.
