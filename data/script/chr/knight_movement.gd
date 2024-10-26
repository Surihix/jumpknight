extends CharacterBody2D

@export var SPEED = 300.0
@export var JUMP_VELOCITY = -400.0
@export var FLOAT_VELOCITY = -100.0

@onready var animated_sprite = $AnimatedSprite2D

var jumpsDone = 0

func _physics_process(delta):
	if GameManager.canMove:
		# Add the gravity.
		if not is_on_floor():
			velocity += get_gravity() * delta
		
		if is_on_floor():
			jumpsDone = 0
		
		# Handle jump evolutions.
		if GameManager.isJumpEnabled and Input.is_action_just_pressed("jump") and jumpsDone < GameManager.jumpsAllowed and !GameManager.isFloatEnabled:
			AudioManager.playJumpSound()
			velocity.y = JUMP_VELOCITY
			jumpsDone += 1
		 
		if GameManager.isFloatEnabled and Input.is_action_pressed("jump"):
			velocity.y = FLOAT_VELOCITY
		
		# Get the input direction: -1, 0, 1
		var direction = Input.get_axis("move_left", "move_right")
		
		# Flip the Sprite
		if direction > 0:
			animated_sprite.flip_h = false
		elif direction < 0:
			animated_sprite.flip_h = true 
		
		# Play Animations
		if is_on_floor():
			if direction == 0:
				animated_sprite.play("idle")
			else:
				animated_sprite.play("walk")
		else:
			animated_sprite.play("jump")
		
		# Apply movement
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		
		move_and_slide()
