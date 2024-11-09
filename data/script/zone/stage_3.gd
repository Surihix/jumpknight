extends Node

func _ready():
	GameManager.currentStage = 3
	GameManager.currentStageUiTxtNode = get_tree().current_scene.get_node("UI").get_node("CollectionCounter")
	GameManager.canMove = true


func _on_exit_body_entered(_body):
	print("exited_stage_3")
	GameManager.coinsCollectedInPrevStages = GameManager.coinsCollected
	GameManager.canMove = false
	AudioManager.isTrackSet = false
	ZoneTransition.changeSceneByTransition("res://data/zone/stage_4.tscn")
	#get_tree().call_deferred("change_scene_to_file", "res://data/zone/stage_4.tscn")
