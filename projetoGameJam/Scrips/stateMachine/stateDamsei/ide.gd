extends State
class_name IdeDamsi


func enter() -> void:
	print("EntrouNoIde")

func exit() -> void:
	pass

func process(delta: float) -> void:
	if Input.is_action_pressed("cima") or Input.is_action_pressed("baixo") or Input.is_action_pressed("esquerda") or Input.is_action_pressed("direta"):
		get_parent().tranziçao(self,"rum")


func physics_process(delta: float) -> void:
	pass
