extends Node

const music_main_background= preload("res://FX/backgroundMusics/Emisphere.mp3")
const music_start_screen_background= preload("res://FX/backgroundMusics/Press_Start.mp3")
const music_level1_background= preload("res://FX/backgroundMusics/level1.mp3")
const sound_button_main= preload("res://FX/sounds/buttonMainSound.wav")

@onready var audioPlayerBackground= $AudioStreamPlayerBackground

@onready var audioPlayerEffects= $AudioStreamEffects

func _play_music(music: AudioStream):
	if audioPlayerBackground.stream==music:
		return
	
	audioPlayerBackground.stream=music
	audioPlayerBackground.play()
func play_music_main_background():
	_play_music(music_main_background)

func play_music_start_sreen_background():
	_play_music(music_start_screen_background)
	
func play_music_level1_background():
	_play_music(music_level1_background)

func play_sound_button():
	audioPlayerEffects.stream=sound_button_main
	audioPlayerEffects.play()
