extends CharacterBody2D
class_name  damsei

var seepd: float = 60
@export var sprite__player: Sprite2D 
@export var _state_machine: stateMachine 



func _ready() -> void:
	_state_machine.stateMacne(self)

func _process(delta: float) -> void:
	move_and_slide()
	movPlay()


func movPlay() -> void:
	var input_vetc = Vector2(
		Input.get_axis("esquerda","direta"),
		Input.get_axis("cima", "baixo")
	).normalized()
	velocity = input_vetc * seepd

	
func vercquitSprict() -> void:
	if velocity.x > 0:
		sprite__player.flip_h = false
	elif velocity.x < 0:
		sprite__player.flip_h = true
