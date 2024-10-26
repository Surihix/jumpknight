extends Area2D

@onready var animation_player = $AnimationPlayer

func _on_body_entered(_body):
	AudioManager.playCoinSound()
	GameManager.coinsCollected += 1
	(GameManager.currentStageUiTxtNode).text = "x" + str(GameManager.coinsCollected)
	animation_player.play("Coin_pickUp")
