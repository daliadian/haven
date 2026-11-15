extends Node
@onready var area_2d: Area2D = $Area2D


func _ready():
	$Label9.visible_ratio = 0
	$Area2D.body_entered.connect(_play_animation)

func _play_animation(_body):
	$Area2D.body_entered.disconnect(_play_animation)
	$AnimationPlayer.play("br3")
