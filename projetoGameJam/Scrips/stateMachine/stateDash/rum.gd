extends State
class_name Rum

func enter() -> void:
	player.animation.play("Rum")
	print("Entrou no rum")

func exit() -> void:
	pass

func process(delta: float) -> void:
	if not  Input.is_action_pressed("baixo") and not Input.is_action_pressed("cima") and not Input.is_action_pressed("esquerda") and not Input.is_action_pressed("direta") :
		get_parent().tranziçao(self, "Ide")
	

func physics_process(delta: float) -> void:
	pass
