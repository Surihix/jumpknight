extends Area2D

@onready var timer = $Timer

func _on_body_entered(body):
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	timer.start()


func _on_timer_timeout():
	GameManager.coinsCollected = 0
	GameManager.coinsCollectedInPrevStages = 0
	
	match GameManager.currentStage:
		3:
			GameManager.isJumpEnabled = false
		4:
			GameManager.jumpsAllowed = 1
		5:
			GameManager.isJumpEnabled = true
			GameManager.jumpsAllowed = 2
			GameManager.isFloatEnabled = false
	
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
