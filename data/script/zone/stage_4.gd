extends Node

func _ready():
	GameManager.currentStage = 4
	GameManager.currentStageUiTxtNode = get_tree().current_scene.get_node("UI").get_node("CollectionCounter")
	
	if !AudioManager.isTrackSet:
		AudioManager.setStageTrack()
	
	(GameManager.currentStageUiTxtNode).text = "x" + str(GameManager.coinsCollectedInPrevStages)
	GameManager.canMove = true


func _on_exit_body_entered(_body):
	print("exited_stage_4")
	GameManager.coinsCollectedInPrevStages = GameManager.coinsCollected
	GameManager.canMove = false
	AudioManager.isTrackSet = false
	ZoneTransition.changeSceneByTransition("res://data/zone/stage_5.tscn")
	#get_tree().call_deferred("change_scene_to_file", "res://data/zone/stage_5.tscn")
