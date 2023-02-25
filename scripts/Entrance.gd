extends Spatial

var player: Player = null
var initial_spawn = false

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	if initial_spawn:
		player.global_transform = $InitialSpawnPoint.global_transform
	else:
		player.global_transform = $SpawnPoint.global_transform

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
