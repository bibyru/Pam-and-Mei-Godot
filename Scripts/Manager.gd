extends Node

func ReqPause(num = 0):
	if num == 0:
		if get_tree().paused == false:
			get_tree().paused = true
		else:
			get_tree().paused = false
	else:
		get_tree().paused = true

func ReqQuit():
	ReqPause(1)
	get_tree().quit()
