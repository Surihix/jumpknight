extends Node

func _ready():
	GameManager.currentStage = 3
	GameManager.currentStageUiTxtNode = get_tree().current_scene.get_node("UI").get_node("CollectionCounter")
	GameManager.currentStagePopUpTxtNode = get_tree().current_scene.get_node("PopupText")
	GameManager.canMove = true


func _on_exit_body_entered(_body):
	print("exited_stage_3")
	GameManager.coinsCollectedInPrevStages = GameManager.coinsCollected
	get_tree().current_scene.get_node("knight").visible = false
	GameManager.canMove = false
	AudioManager.isTrackSet = false
	ZoneTransition.changeSceneByTransition("res://data/zone/stage_4.tscn")
