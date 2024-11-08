extends Node

@onready var instructions_label = $InstructionsLabel
const PIXEL_OPERATOR_8 = preload("res://data/ui/font/PixelOperator8.ttf")

func _ready():
	instructions_label.text = tr("$tutorial_1")
	adjustStageLabel()
	GameManager.currentStage = 1
	AudioManager.setStageTrack()
	AudioManager.isTrackSet = true
	GameManager.canMove = true


func _on_exit_body_entered(_body):
	print("exited_stage_1")
	GameManager.canMove = false
	get_tree().call_deferred("change_scene_to_file", "res://data/zone/stage_2.tscn")


func adjustStageLabel():
	match TranslationServer.get_locale():
		"en":
			instructions_label.add_theme_font_override("font", PIXEL_OPERATOR_8)
		"ja":
			instructions_label.remove_theme_font_override("font")
