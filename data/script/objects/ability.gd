extends Area2D

@onready var animation_player = $AnimationPlayer

func _on_body_entered(_body):
	AudioManager.playAbilitySound()
	
	match GameManager.currentStage:
		3:
			GameManager.isJumpEnabled = true
			print("jumpEnabled")
		4:
			GameManager.jumpsAllowed = 2
			GameManager.isDoubleJumpEnabled = true
			print("doubleJumpEnabled")
		5:
			GameManager.isJumpEnabled = false
			GameManager.isFloatEnabled = true
			print("floatEnabled")
	
	animation_player.play("Ability_pickUp")
