extends CharacterBody2D
class_name  Dash

var seepd: float = 60
@onready var sprite__player: Sprite2D = $player



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
