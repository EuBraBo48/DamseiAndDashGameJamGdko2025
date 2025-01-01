extends State
class_name RumDamsei


func enter() -> void:
	print("EntrouNoRum")

func exit() -> void:
	pass

func process(delta: float) -> void:
	if not Input.is_action_pressed("cima") or not Input.is_action_pressed("baixo") or not Input.is_action_pressed("esqueda") or  not Input.is_action_pressed("direita"):
		get_parent().tranziçao(self, "ide")
	


func physics_process(delta: float) -> void:
	pass
