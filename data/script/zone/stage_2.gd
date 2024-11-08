extends Node

@onready var coin_msg_label = $CoinMessage/CoinMsgLabel
@onready var ability_msg_label = $AbilityMessage/AbilityMsgLabel
@onready var ability_msg_label_2 = $AbilityMessage/AbilityMsgLabel2
@onready var exit_msg_label = $ExitMessage/ExitMsgLabel

func _ready():
	coin_msg_label.text = tr("$tutorial_2_1")
	ability_msg_label.text = tr("$tutorial_2_2")
	ability_msg_label_2.text = tr("$tutorial_2_3")
	exit_msg_label.text = tr("$tutorial_2_4")
	GameManager.currentStage = 2
	GameManager.canMove = true


func _on_exit_body_entered(_body):
	print("exited_stage_2")
	GameManager.canMove = false
	get_tree().call_deferred("change_scene_to_file", "res://data/zone/stage_3.tscn")


func adjustStageLabel():
	pass
