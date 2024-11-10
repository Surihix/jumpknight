extends Node

@onready var base_menu_anim = $BaseMenu/AnimationPlayer
@onready var options_menu_anim = $OptionsMenu/AnimationPlayer
@onready var credits_menu_anim = $CreditsMenu/AnimationPlayer
@onready var back_btn_anim = $BackButton/AnimationPlayer

@onready var new_game_button = $BaseMenu/NewGameButton
@onready var options_button = $BaseMenu/OptionsButton
@onready var credits_button = $BaseMenu/CreditsButton
@onready var back_button = $BackButton

@onready var sfx_option_label = $OptionsMenu/SFXOptionLabel
@onready var sfx_slider = $OptionsMenu/SFXSlider
@onready var music_option_label = $OptionsMenu/MusicOptionLabel
@onready var music_slider = $OptionsMenu/MusicSlider
@onready var lang_option_label = $OptionsMenu/LangOptionLabel
@onready var lang_option_button = $OptionsMenu/LangOptionButton

@onready var music_credit_label = $CreditsMenu/MusicCreditLabel
@onready var art_sfx_credit_label = $CreditsMenu/ArtSFXCreditLabel
@onready var prog_credit_label = $CreditsMenu/ProgCreditLabel

var isOptionsMenu = false
var isCreditsMenu = false

func _ready():
	_setTranslation()
	_enableBaseMenu()

func _setTranslation():
	new_game_button.text = tr("$menu_1")
	options_button.text = tr("$menu_2")
	sfx_option_label.text = tr("$menu_2_1")
	music_option_label.text = tr("$menu_2_2")
	lang_option_label.text = tr("$menu_2_3")
	credits_button.text = tr("$menu_3")
	music_credit_label.text = tr("$menu_3_1")
	art_sfx_credit_label.text = tr("$menu_3_2")
	prog_credit_label.text = tr("$menu_3_3")
	back_button.text = tr("$menu_back")

func _on_new_game_button_mouse_entered():
	if !new_game_button.disabled:
		AudioManager.playNavigateSound()

func _on_new_game_button_pressed():
	AudioManager.playSelectSound()
	ZoneTransition.changeSceneByTransition("res://data/zone/stage_1.tscn")

func _on_options_button_mouse_entered():
	if !options_button.disabled:
		AudioManager.playNavigateSound()

func _on_options_button_pressed():
	AudioManager.playSelectSound()
	isOptionsMenu = true
	_disableBaseMenu()
	_enableOptionsMenu()
	_enableBackButton()

func _on_credits_button_mouse_entered():
	if !credits_button.disabled:
		AudioManager.playNavigateSound()

func _on_credits_button_pressed():
	AudioManager.playSelectSound()
	isCreditsMenu = true
	_disableBaseMenu()
	_enableCreditsMenu()
	_enableBackButton()

func _on_back_button_mouse_entered():
	if !back_button.disabled:
		AudioManager.playNavigateSound()

func _on_back_button_pressed():
	AudioManager.playSelectSound()
	_disableBackButton()
	
	if (isOptionsMenu):
		isOptionsMenu = false
		_disableOptionsMenu()
	
	if (isCreditsMenu):
		isCreditsMenu = false
		_disableCreditsMenu()
	
	_enableBaseMenu()


# Options Menu buttons
func _on_sfx_slider_mouse_entered():
	if sfx_slider.editable && sfx_slider.scrollable:
		AudioManager.playNavigateSound()

func _on_sfx_slider_value_changed(value):
	AudioManager.setBusVolume(value, 1)

func _on_music_slider_mouse_entered():
	if music_slider.editable && music_slider.scrollable:
		AudioManager.playNavigateSound()

func _on_music_slider_value_changed(value):
	AudioManager.setBusVolume(value, 2)

func _on_lang_option_button_mouse_entered():
	if !lang_option_button.disabled:
		AudioManager.playNavigateSound()

func _on_lang_option_button_item_selected(index):
	match index:
		0:
			TranslationServer.set_locale("en")
			GameManager.gameLocale = "en"
			_changeLabelFont()
		1:
			TranslationServer.set_locale("ja")
			GameManager.gameLocale = "ja"
			_changeLabelFont()
	
	_setTranslation()

func _changeLabelFont():
	match GameManager.gameLocale:
		"en":
			sfx_option_label.add_theme_font_override("font", FontConstants.PIXEL_OPERATOR_8_BOLD)
			music_option_label.add_theme_font_override("font", FontConstants.PIXEL_OPERATOR_8_BOLD)
			lang_option_label.add_theme_font_override("font", FontConstants.PIXEL_OPERATOR_8_BOLD)
			new_game_button.add_theme_font_override("font", FontConstants.PIXEL_OPERATOR_8_BOLD)
			options_button.add_theme_font_override("font", FontConstants.PIXEL_OPERATOR_8_BOLD)
			credits_button.add_theme_font_override("font", FontConstants.PIXEL_OPERATOR_8_BOLD)
			music_credit_label.add_theme_font_override("font", FontConstants.PIXEL_OPERATOR_8)
			art_sfx_credit_label.add_theme_font_override("font", FontConstants.PIXEL_OPERATOR_8)
			prog_credit_label.add_theme_font_override("font", FontConstants.PIXEL_OPERATOR_8)
		"ja":
			sfx_option_label.remove_theme_font_override("font")
			music_option_label.remove_theme_font_override("font")
			lang_option_label.remove_theme_font_override("font")
			new_game_button.remove_theme_font_override("font")
			options_button.remove_theme_font_override("font")
			credits_button.remove_theme_font_override("font")
			music_credit_label.remove_theme_font_override("font")
			art_sfx_credit_label.remove_theme_font_override("font")
			prog_credit_label.remove_theme_font_override("font")


# Base Menu anim functions
func _enableBaseMenu():
	base_menu_anim.play("BaseMenu_fade")
	await base_menu_anim.animation_finished
	new_game_button.disabled = false
	options_button.disabled = false
	credits_button.disabled = false

func _disableBaseMenu():
	new_game_button.disabled = true
	options_button.disabled = true
	credits_button.disabled = true
	base_menu_anim.play_backwards("BaseMenu_fade")
	await base_menu_anim.animation_finished


# Options Menu anim functions
func _enableOptionsMenu():
	options_menu_anim.play("OptionsMenu_fade")
	await options_menu_anim.animation_finished
	sfx_slider.editable = true
	sfx_slider.scrollable = true
	music_slider.editable = true
	music_slider.scrollable = true
	lang_option_button.disabled = false

func _disableOptionsMenu():
	sfx_slider.editable = false
	sfx_slider.scrollable = false
	music_slider.editable = false
	music_slider.scrollable = false
	lang_option_button.disabled = true
	options_menu_anim.play_backwards("OptionsMenu_fade")
	await options_menu_anim.animation_finished


# Credits Menu anim functions
func _enableCreditsMenu():
	credits_menu_anim.play("CreditsMenu_fade")
	await credits_menu_anim.animation_finished

func _disableCreditsMenu():
	credits_menu_anim.play_backwards("CreditsMenu_fade")
	await credits_menu_anim.animation_finished


# Back button anim functions
func _enableBackButton():
	back_btn_anim.play("BackBtn_fade")
	await back_btn_anim.animation_finished
	back_button.disabled = false

func _disableBackButton():
	back_button.disabled = true
	back_btn_anim.play_backwards("BackBtn_fade")
	await back_btn_anim.animation_finished
