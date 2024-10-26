extends Node

@onready var instructions_label = $InstructionsLabel

func _ready():
	instructions_label.text = tr("$tutorial_1")
	GameManager.currentStage = 1
	AudioManager.setStageTrack()
	AudioManager.isTrackSet = true
	GameManager.canMove = true


func _on_exit_body_entered(_body):
	print("exited_stage_1")
	GameManager.canMove = false
	get_tree().call_deferred("change_scene_to_file", "res://data/zone/stage_2.tscn")
