extends AudioStreamPlayer

const music_main_background= preload("res://FX/backgroundMusics/Emisphere.mp3")
const music_start_screen_background= preload("res://FX/backgroundMusics/Press_Start.mp3")
const music_level1_background= preload("res://FX/backgroundMusics/level1.mp3")

func _play_music(music: AudioStream):
	if stream==music:
		return
	
	stream=music
	play()
func play_music_main_background():
	_play_music(music_main_background)

func play_music_start_sreen_background():
	_play_music(music_start_screen_background)
	
func play_music_level1_background():
	_play_music(music_level1_background)
