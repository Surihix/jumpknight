extends Node

@onready var shader_layer = $ShaderLayer

func _ready():
	if GameManager.isShaderOn:
		shader_layer.visible = true
	
	GameManager.currentStage = 5
	GameManager.currentStageUiTxtNode = get_tree().current_scene.get_node("UI").get_node("CollectionCounter")
	GameManager.currentStagePopUpTxtNode = get_tree().current_scene.get_node("PopupText")
	
	if !AudioManager.isTrackSet:
		AudioManager.setStageTrack()
	
	(GameManager.currentStageUiTxtNode).text = "x" + str(GameManager.coinsCollectedInPrevStages)
	GameManager.coinsCollected = GameManager.coinsCollectedInPrevStages
	GameManager.canMove = true


func _on_exit_body_entered(_body):
	print("exited_stage_4")
	GameManager.coinsCollectedInPrevStages = GameManager.coinsCollected
	get_tree().current_scene.get_node("knight").visible = false
	GameManager.canMove = false
	AudioManager.isTrackSet = false
	ZoneTransition.changeSceneByTransition("res://data/zone/end_screen.tscn")
