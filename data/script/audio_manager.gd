extends Node

@onready var navigate_sound = $NavigateSound
@onready var select_sound = $SelectSound
@onready var jump_sound = $JumpSound
@onready var ability_sound = $AbilitySound
@onready var coin_sound = $CoinSound

var currentStageTrack = ""
var isTrackSet = false

func setBusVolume(volume: float, bus_index: int):
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(volume))
	AudioServer.set_bus_mute(bus_index, volume < 0.01)

func setStageTrack():
	match GameManager.currentStage:
		1:
			currentStageTrack = load("res://data/sound/music/bgm_the_darkness_below.wav")
		4:
			currentStageTrack = load("res://data/sound/music/bgm_pixel_party.wav")
		5:
			currentStageTrack = load("res://data/sound/music/bgm_mystical_ocean_puzzle_game.wav")
	
	$MusicPlayer.stream = currentStageTrack
	$MusicPlayer.play()
	isTrackSet = true

func _on_music_player_finished():
	$MusicPlayer.stream = currentStageTrack
	$MusicPlayer.play()

func playNavigateSound():
	navigate_sound.play()

func playSelectSound():
	select_sound.play()

func playCoinSound():
	coin_sound.play()

func playAbilitySound():
	ability_sound.play()

func playJumpSound():
	jump_sound.play()
