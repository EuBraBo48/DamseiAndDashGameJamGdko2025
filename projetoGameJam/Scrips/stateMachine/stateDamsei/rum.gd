extends State
class_name RumDamsei


func enter() -> void:
	player.animation.play("rum")
	print("EntrouNoRum")

func exit() -> void:
	pass

func process(delta: float) -> void:
	if not  Input.is_action_pressed("baixo") and not Input.is_action_pressed("cima") and not Input.is_action_pressed("esquerda") and not Input.is_action_pressed("direta") :
		get_parent().tranziçao(self, "ide")
	


func physics_process(delta: float) -> void:
	pass
