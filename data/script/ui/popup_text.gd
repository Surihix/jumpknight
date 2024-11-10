extends Node

@onready var label = $Label
@onready var animation_player = $Label/AnimationPlayer
@onready var timer = $Timer

func displayPopUpTxt(posX, posY, text, time):
	timer.wait_time = time
	label.position.x = posX
	label.position.y = posY
	label.text = tr(text)
	
	match TranslationServer.get_locale():
		"en_GB":
			label.add_theme_font_override("normal_font", FontConstants.PIXEL_OPERATOR_8)
			label.add_theme_font_size_override("normal_font_size", 8)
		"ja":
			label.add_theme_font_override("normal_font", FontConstants.LANA_PIXEL)
			label.add_theme_font_size_override("normal_font_size", 11)
	
	animation_player.play("Text_fadeIn")
	timer.start()


func _on_timer_timeout():
	animation_player.play("Text_fadeOut")
	timer.stop()
