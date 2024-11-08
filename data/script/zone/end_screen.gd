extends Node

@onready var evolved_txt_label = $EvolvedTxtLabel
@onready var total_coins_collected_label = $TotalCoinsCollectedLabel

func _ready():
	AudioManager.stopStageTrack()
	evolved_txt_label.text = tr("$endMsg")
	total_coins_collected_label.text = tr("$coinCollected") + " " + str(GameManager.coinsCollected)
