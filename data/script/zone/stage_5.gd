extends Node

func _ready():
	GameManager.currentStage = 5
	GameManager.currentStageUiTxtNode = get_tree().current_scene.get_node("UI").get_node("CollectionCounter")
	
	if !AudioManager.isTrackSet:
		AudioManager.setStageTrack()
	
	(GameManager.currentStageUiTxtNode).text = "x" + str(GameManager.coinsCollectedInPrevStages)
	GameManager.coinsCollected = GameManager.coinsCollectedInPrevStages
	GameManager.canMove = true
