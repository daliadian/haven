extends Node2D
@onready var animation_player: AnimatedSprite2D = $AnimationPlayer
@onready var endsong: AudioStreamPlayer2D = $endsong

func _ready() -> void:
	animation_player.play("ending")
	endsong.play()
	
