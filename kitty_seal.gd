extends CharacterBody2D
@onready var sfx_meow: AudioStreamPlayer = $sfx_meow

var is_charged_jumping = false
const SPEED = 400.0
const JUMP_VELOCITY = -800.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func get_random_event_type():
	var roll: float = randf() 
	if roll < 0.20:
		sfx_meow.play() 

func _physics_process(delta: float) -> void:
	
	if ( velocity.x > 1 || velocity.x < -1):
		animated_sprite_2d.animation = "walk"
		
	else:
		animated_sprite_2d.animation = "default"
	if not is_on_floor():
		velocity += get_gravity() * delta
		animated_sprite_2d.animation = "jump"
	
	if is_on_floor():
		is_charged_jumping = false

	if Input.is_action_just_pressed("chargedjump") and is_on_floor():
		is_charged_jumping = true
		velocity.y = JUMP_VELOCITY * 2
		animated_sprite_2d.play("chargedjump")
		
	elif Input.is_action_just_pressed("jump") and is_on_floor() and not is_charged_jumping:
		velocity.y = JUMP_VELOCITY
		get_random_event_type()
	#if Input.is_action_just_pressed("chargedjump") and is_on_floor():
		#velocity.y = JUMP_VELOCITY * 2
		#animated_sprite_2d.play("chargedjump")
	#elif Input.is_action_just_pressed("jump") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
		#get_random_event_type()

	
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	var isLeft = velocity.x < 0
	animated_sprite_2d.flip_h = isLeft
	


func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	pass # Replace with function body.
