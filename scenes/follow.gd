extends Camera2D
@onready var kitty_seal: CharacterBody2D = $"../KittySeal"

func _process(delta: float) -> void:
	if not kitty_seal:
		return
	if kitty_seal.global_position.y != global_position.y:
		global_position.y = kitty_seal.global_position.y
	
