extends Node

@onready var coin_msg_label = $CoinMessage/CoinMsgLabel
@onready var ability_msg_label = $AbilityMessage/AbilityMsgLabel
@onready var ability_msg_label_2 = $AbilityMessage/AbilityMsgLabel2
@onready var exit_msg_label = $ExitMessage/ExitMsgLabel

const PIXEL_OPERATOR_8 = preload("res://data/ui/font/PixelOperator8.ttf")
const LANA_PIXEL = preload("res://data/ui/font/LanaPixel.ttf")

func _ready():
	coin_msg_label.text = tr("$tutorial_2_1")
	ability_msg_label.text = tr("$tutorial_2_2")
	ability_msg_label_2.text = tr("$tutorial_2_3")
	exit_msg_label.text = tr("$tutorial_2_4")
	adjustStageLabel()
	GameManager.currentStage = 2
	GameManager.canMove = true


func _on_exit_body_entered(_body):
	print("exited_stage_2")
	GameManager.canMove = false
	get_tree().call_deferred("change_scene_to_file", "res://data/zone/stage_3.tscn")


func adjustStageLabel():
	match TranslationServer.get_locale():
		"en":
			coin_msg_label.add_theme_font_override("font", PIXEL_OPERATOR_8)
			coin_msg_label.add_theme_font_size_override("font_size", 8)
			
			ability_msg_label.add_theme_font_override("font", PIXEL_OPERATOR_8)
			ability_msg_label.add_theme_font_size_override("font_size", 8)
			
			ability_msg_label_2.add_theme_font_override("font", PIXEL_OPERATOR_8)
			ability_msg_label_2.add_theme_font_size_override("font_size", 8)
			
			exit_msg_label.add_theme_font_override("font", PIXEL_OPERATOR_8)
			exit_msg_label.add_theme_font_size_override("font_size", 8)
		"ja":
			coin_msg_label.add_theme_font_override("font", LANA_PIXEL)
			coin_msg_label.add_theme_font_size_override("font_size", 11)
			
			ability_msg_label.add_theme_font_override("font", LANA_PIXEL)
			ability_msg_label.add_theme_font_size_override("font_size", 11)
			
			ability_msg_label_2.add_theme_font_override("font", LANA_PIXEL)
			ability_msg_label_2.add_theme_font_size_override("font_size", 11)
			
			exit_msg_label.add_theme_font_override("font", LANA_PIXEL)
			exit_msg_label.add_theme_font_size_override("font_size", 11)
