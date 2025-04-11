extends Camera2D

@onready var timer: Timer = $Timer

# Intensidade do "shake" da câmera
var shake_amount := 0
# Offset padrão e inicial para o shake (valores podem ser ajustados conforme necessidade)
var default_offset := 5
var initial_offset := 0

func _ready() -> void:
	# Desativa o processamento por padrão
	set_process(false)

func _process(delta: float) -> void:
	# Gera um pequeno deslocamento aleatório baseado na intensidade do shake
	offset = Vector2(randf_range(-shake_amount, shake_amount), randf_range(-shake_amount, shake_amount))

func shake_camera(new_shake: float, shake_time: float = 0.4, shake_limit: float = 20.0) -> void:
	# Ativa o processamento
	set_process(true)
	# Incrementa a intensidade do shake
	shake_amount += new_shake
	
	# Limita a intensidade do shake para evitar valores muito altos
	if shake_amount > shake_limit:
		shake_amount = shake_limit

	# Configura o tempo do timer para controlar a duração do shake
	timer.wait_time = shake_time
	timer.start()


func _on_timer_timeout() -> void:
	set_process(false)
	shake_amount = 0.
