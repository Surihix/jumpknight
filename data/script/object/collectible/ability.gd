extends Area2D

@onready var animation_player = $AnimationPlayer
var abiText = null

func _on_body_entered(_body):
	AudioManager.playAbilitySound()
	
	match GameManager.currentStage:
		3:
			GameManager.isJumpEnabled = true
			print("jumpEnabled")
			abiText = tr("$abi_jump")
			
			match TranslationServer.get_locale():
				"en_GB":
					GameManager.currentStagePopUpTxtNode.displayPopUpTxt(-82, -105, abiText, 3)
				"ja":
					GameManager.currentStagePopUpTxtNode.displayPopUpTxt(-82, -105, abiText, 12)
			
		4:
			GameManager.jumpsAllowed = 2
			GameManager.isDoubleJumpEnabled = true
			print("doubleJumpEnabled")
			abiText = tr("$abi_jump_double")
			
			match TranslationServer.get_locale():
				"en_GB":
					GameManager.currentStagePopUpTxtNode.displayPopUpTxt(-135, -22, abiText, 3)
				"ja":
					GameManager.currentStagePopUpTxtNode.displayPopUpTxt(-135, -22, abiText, 12)
			
		5:
			GameManager.isJumpEnabled = false
			GameManager.isFloatEnabled = true
			print("floatEnabled")
			abiText = tr("$abi_float")
			
			match TranslationServer.get_locale():
				"en_GB":
					GameManager.currentStagePopUpTxtNode.displayPopUpTxt(-99, -112, abiText, 3)
				"ja":
					GameManager.currentStagePopUpTxtNode.displayPopUpTxt(-99, -112, abiText, 12)
	
	animation_player.play("Ability_pickUp")
