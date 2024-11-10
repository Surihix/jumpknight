extends Node

@onready var evolved_txt_label = $EvolvedTxtLabel
@onready var total_coins_collected_label = $TotalCoinsCollectedLabel

func _ready():
	AudioManager.stopStageTrack()
	evolved_txt_label.text = tr("$endMsg")
	total_coins_collected_label.text = tr("$coinCollected") + " " + str(GameManager.coinsCollected)
	adjustStageLabel()


func adjustStageLabel():
	match TranslationServer.get_locale():
		"en_GB":
			evolved_txt_label.add_theme_font_override("font", FontConstants.PIXEL_OPERATOR_8_BOLD)
			evolved_txt_label.position.x = 70
			evolved_txt_label.position.y = 255
			total_coins_collected_label.add_theme_font_override("font", FontConstants.PIXEL_OPERATOR_8_BOLD)
			total_coins_collected_label.position.x = 247
			total_coins_collected_label.position.y= 375
		"ja":
			evolved_txt_label.remove_theme_font_override("font")
			evolved_txt_label.position.x = 350
			evolved_txt_label.position.y = 255
			total_coins_collected_label.remove_theme_font_override("font")
			total_coins_collected_label.position.x = 350
			total_coins_collected_label.position.y = 375
