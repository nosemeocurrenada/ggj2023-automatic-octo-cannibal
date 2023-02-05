extends Node


func start_music():
	if not $music.playing:
		$music.playing = true
		$music.stream_paused = false


func stop_music():
	$music.playing = false
	$music.stream_paused = true
	$music.stop()
	
